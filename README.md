# GEP Field Affinity Analysis

基于 LLVM Pass 的结构体字段亲和性分析系统，通过静态分析 GEP 指令提取字段访问信息，运行时记录字段共现关系，离线分析生成结构体字段重排建议，以优化缓存利用率。

## 功能介绍

本工具解决的核心问题：**结构体字段在内存中的排列顺序是否合理？**

当程序频繁交替访问同一结构体的不同字段时，如果这些字段分布在不同缓存行（cacheline）中，会导致缓存失效（cache miss），严重影响性能。本工具通过以下三个阶段自动发现高亲和度的字段对，并给出重排建议：

1. **编译期静态分析**：遍历 LLVM IR 中的 GEP 指令，提取结构体字段访问信息
2. **运行时共现计数**：在已插桩的程序中记录字段访问的时间窗口共现关系
3. **离线装箱优化**：基于共现矩阵，将高亲和度的字段对分配到同一缓存行

## 理论基础

### 缓存行与结构体布局

现代 CPU 的缓存以缓存行（通常 64 字节）为最小加载单位。当程序访问结构体的某个字段时，整个缓存行都会被加载到 L1 缓存中。如果后续访问的字段恰好在同一缓存行中，就能直接命中缓存；反之则需要从更慢的存储层级加载。

```
缓存行 0 (0-63 bytes)    | 缓存行 1 (64-127 bytes)
┌──────────────────────┐ | ┌──────────────────────┐
│ field_a  field_b     │ | │ field_c  field_d     │
└──────────────────────┘ | └──────────────────────┘

若 field_a 和 field_c 频繁交替访问 → 2 次 cache miss
若 field_a 和 field_b 频繁交替访问 → 1 次 cache miss（缓存行命中）
```

### 亲和性模型

定义字段 `f_i` 和 `f_j` 的**亲和度** `A(i,j)` 为：在滑动时间窗口内，两个字段的访问在时间上相邻出现的次数。

```
时间线：  f1  f2  f1  f3  f2  f1  f2  ...
窗口 W=3：[f1, f2, f1] → f1-f2 共现 +2, f1-f1 不计
```

亲和度越高，说明两个字段越应该放在同一缓存行中。

### 贪心装箱算法

对于每个结构体，将其字段的亲和度关系建模为加权无向图：
- 节点 = 字段
- 边权 = 亲和度

按边权降序贪心装箱：优先将亲和度最高的字段对放入同一缓存行，超出 64 字节则开新行。

## 技术细节

### 支持的数据结构类型

本工具使用**三级分析策略**覆盖所有 GEP 访问模式：

| 数据结构 | C 代码示例 | LLVM GEP 模式 | 分析路径 | 处理方式 |
|----------|-----------|---------------|----------|----------|
| **简单结构体** | `foo.field` | `getelementptr inbounds i8, ptr %p, i64 4` | TBAA | 从 store/load 的 `!tbaa` 元数据恢复结构体类型和字段偏移 |
| **嵌套结构体** | `outer.inner.p` | `getelementptr inbounds i8, ptr @g_outer, i64 8` | TBAA | `buildAccessPathRecursive` 递归展开嵌套层级 |
| **数组字段** | `foo.d[i]` | `getelementptr inbounds [16 x i8], ptr ..., i64 0, i64 i` | TBAA | `getContainingFieldIndex` 区间匹配定位到数组字段 |
| **结构体数组** | `arr[i].field` | `getelementptr inbounds i8, ptr @g_arr, i64 40` | TBAA | TBAA 偏移直接定位到 `[5 x %struct.Foo]` 的元素字段 |
| **堆分配结构体** | `malloc(40); p->b` | `getelementptr inbounds i8, ptr %malloc_result, i64 4` | TBAA | TBAA 元数据在 store/load 上，不依赖指针溯源，malloc 指针统一处理 |
| **全局/局部变量** | `g_foo.field` / `local.field` | 同简单结构体 | TBAA | 栈指针通过 `alloca %struct.Foo` 可溯源；全局通过 `@g_foo` 类型 |
| **ConstantExpr GEP** | `ptr getelementptr inbounds (i8, ptr @g_foo, i64 4)` | ConstantExpr 嵌入 store/load 操作数 | TBAA | `run()` 遍历所有指令的 operands，同时识别 `GetElementPtrInst` 和 `ConstantExpr(GEP)` |
| **Typed GEP（兼容）**| `getelementptr inbounds %struct.Foo, ptr %p, i32 0, i32 1` | 含 struct type 的 GEP | Typed | `gep_type_iterator` 逐层导航（向后兼容非 opaque pointer IR） |

### 核心算法：三级分析策略

```cpp
analyzeGEP(GEPV, UserInst, ...)                    ← 统一入口
    │
    ├─ 策略1: TBAA 路径 (analyzeGEPFromTBAA)       ← 主路径，针对 opaque pointer IR
    │     ├─ 从 store/load/memcpy 取 !tbaa 元数据
    │     ├─ 解析 access tag: {base_struct, access_type, byte_offset}
    │     ├─ findStructTypeInModule() 匹配 "Foo" ↔ "struct.Foo"
    │     └─ buildAccessPathRecursive() 递归展开嵌套结构体
    │
    ├─ 策略2: Typed GEP (analyzeGEPTyped)          ← 兼容旧版 IR
    │     └─ gep_type_iterator 遍历 SourceElementType → 索引 → StructType 链
    │
    └─ 策略3: Def-Use 溯源 (analyzeGEPDefUse)      ← 兜底路径
          ├─ 手动计算 GEP 字节偏移
          ├─ 追溯指针操作数: GV → Alloca → BitCast → CallBase
          └─ getContainingFieldIndex() 非精确区间匹配
```

**TBAA 元数据解析**（核心创新）：

LLVM 的 `!tbaa` 元数据精确记录了每次内存访问的类型和偏移：

```
LLVM IR:  store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), !tbaa !131

!131 = !{!123, !127, i64 4}
!123 = !{!"Foo", !124, i64 0, !127, i64 4, !128, i64 8, !125, i64 16, !129, i64 32}
!127 = !{!"float", !125, i64 0}
```

解析过程：
1. `!131` → base=`!123`="Foo", access=`!127`="float", offset=4
2. 在 `struct.Foo` 中偏移 4 的字段 → field[1] (b: float) ✓
3. 若该字段本身是结构体（如 Outer 中 field[1] 是 Inner），递归展开

**嵌套结构体递归展开**：

```
输入: Outer, offset=8 (TBAA: 访问 Outer 的第 8 字节)
步骤1: Outer 中 offset 8 → field 1 (inner: Inner), nested_offset=0
步骤2: Inner 中 offset 0 → field 0 (p: float), 停止
输出: [{struct:"struct.Outer", field:1, offset:8},
       {struct:"struct.Inner", field:0, offset:0}]
```

**非精确偏移匹配**（`getContainingFieldIndex`）：

```cpp
// 对于 struct Foo { int a; float b; double c; [16 x i8] d; i64 e; }
// offset=18 落在 d[2]，返回 field_idx=3 (d 字段)
// 而不再要求精确匹配 offset==16
```

**ConstantExpr GEP 扫描**：

```cpp
// run() 不再仅扫描 GetElementPtrInst，而是遍历所有指令的所有 operands:
for (Use &U : I.operands()) {
    Value *V = U.get();
    if (!isGEPValue(V)) continue;  // 同时识别 GetElementPtrInst 和 ConstantExpr(GEP)
    analyzeGEP(V, hasTBAA ? &I : nullptr, ...);
}
```

**关键设计决策**：记录**最深层的结构体字段访问**（leaf struct field）。例如 `outer.inner.q` 会记录为 `struct.Inner` 的字段 `q`，而非 `struct.Outer` 的字段 `inner`。这是因为：
- 亲和性分析关注的是实际被访问的内存位置
- `inner.q` 和直接创建的 `Inner` 对象的 `.q` 访问应共享同一个 `field_id`
- 便于跨场景统计同一字段的访问频率

同时，通过 `access_path` 字段保留完整的访问路径，例如 `outer.inner.q` 的 `access_path` 为：
```json
[
  {"struct": "struct.Outer", "field": 1, "field_offset": 8},
  {"struct": "struct.Inner", "field": 1, "field_offset": 8}
]
```
这样既保留了亲和性分析所需的叶子字段信息，又不丢失嵌套上下文。

### 源码定位

通过 LLVM 的 `DebugLoc` 元数据提取每条 GEP 指令对应的源码位置（文件名、行号、列号）。**编译时需加 `-g` 选项**以保留调试信息。

对于内联函数中的 GEP，`DebugLoc` 会自动指向原始调用点（通过 `getInlinedAt()` 链），确保定位到用户代码而非库代码。

```json
"source": {
  "file": "/home/user/test.c",
  "line": 42,
  "col": 15
}
```

当未加 `-g` 编译时，`source` 字段为 `{"file": "", "line": 0, "col": 0}`。

### 不支持的场景

| 场景 | 原因 | 后续计划 |
|------|------|----------|
| 无 TBAA 元数据（手写 IR、无调试信息编译） | 类型信息完全丢失 | 需要 `-g` + 正常 clang 编译 |
| Opaque 结构体 | 无字段布局信息 | 需要类型定义完整 |
| 无名结构体 | 无法唯一标识 | 需要调试信息辅助 |
| 动态字段索引 `arr[variable]` | TBAA 偏移无法匹配到精确元素 | 已通过区间匹配定位到包含字段 |

### 系统架构

```
┌─────────────────────────────────────────────────────────────┐
│                     编译期 (LLVM Pass)                       │
│                                                             │
│  源代码 ──clang──► LLVM IR ──GEPFieldAnalysisPass──► 插桩IR  │
│                          │                    │              │
│                          │                    └── gep_field_map.json
│                          │                                   │
│                          └── 在每个 GEP 对应的 store/load 前插入:  │
│                              call void @__record_field_access(i32 fid)
│                                                                   │
│  GEP 识别策略:                                                     │
│  ① GetElementPtrInst (独立 GEP 指令)                               │
│  ② ConstantExpr GEP (嵌入 store/load 操作数)                       │
│  ─── 均通过 TBAA 元数据恢复字段信息 ───                              │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     运行时 (libaffinity)                     │
│                                                             │
│  插桩程序执行 ──► __record_field_access(fid) ──► 共现矩阵    │
│                          │                                  │
│                          └── 环形窗口 (W=16) 共现计数         │
│                                                             │
│  程序退出 ──► __dump_affinity() ──► affinity.bin             │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     离线分析 (analyze.py)                    │
│                                                             │
│  gep_field_map.json ──┐                                    │
│  affinity.bin ────────┼──► 加权图 ──► 贪心装箱 ──► reorder.json
│                       │                                     │
│                       └── 按结构体分组，每组的字段按亲和度    │
│                           分配到 64 字节缓存行中              │
└─────────────────────────────────────────────────────────────┘
```

### 插桩机制详解

#### field_id 分配策略

Pass 分析期为每个 `(struct_name, field_index)` 分配全局唯一的 `field_id`（`uint32_t`）：

```cpp
auto Key = std::make_pair(struct_name, field_idx);   // ("struct.Foo", 1)
if (FieldIdMap.count(Key))
    field_id = FieldIdMap[Key];    // 复用已有 ID
else
    field_id = next_field_id++;    // 分配新 ID
```

以 `struct Foo { int a; float b; double c; char d[16]; long e; }` 为例：

| 字段 | StructType | field_idx | field_id |
|------|-----------|-----------|----------|
| `a` | `struct.Foo` | 0 | 0 |
| `b` | `struct.Foo` | 1 | 1 |
| `c` | `struct.Foo` | 2 | 2 |
| `d` | `struct.Foo` | 3 | 3 |
| `e` | `struct.Foo` | 4 | 4 |

嵌套结构体记录**最深层叶子 struct 的字段**：

| 访问 | Leaf Struct | field_idx | field_id |
|------|-------------|-----------|----------|
| `outer.inner.p` | `struct.Inner` | 0 | 5 |
| `outer.inner.q` | `struct.Inner` | 1 | 6 |
| `outer.extra` | `struct.Outer` | 2 | 7 |

选择 `i32` 的原因：
- `2^31` 个字段上限远超任何实际程序
- 单整数 push 比传字符串 / 结构体描述符高效得多
- 真正的类型含义存于 `gep_field_map.json`，运行时只需轻量索引

#### 插桩语义：在字段访问前插入记录

Pass 在每条 `store` / `load` / `memcpy` / `memset`（使用 GEP 访问结构体字段）的**前方**插入 `call void @__record_field_access(i32 fid)`：

```llvm
; 编译前: store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), !tbaa !131
;                                      ↓ Pass 分析 TBAA → field_id=1 (Foo.b)
; 编译后:
call void @__record_field_access(i32 1)        ; 插桩: "即将访问 Foo.b"
store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4)
```

完整函数示例（`init_global` 插桩后 IR）：

```llvm
define void @init_global() {
  call void @__record_field_access(i32 0)      ; Foo.a (field_id=0)
  store i32 1, ptr @g_foo, !tbaa !122

  call void @__record_field_access(i32 1)      ; Foo.b (field_id=1)
  store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), !tbaa !131

  call void @__record_field_access(i32 2)      ; Foo.c (field_id=2)
  store double 3.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), !tbaa !133

  call void @__record_field_access(i32 3)      ; Foo.d (field_id=3)
  tail call void @llvm.memcpy ... @g_foo+16 ...

  call void @__record_field_access(i32 4)      ; Foo.e (field_id=4)
  store i64 42, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), !tbaa !136
  ret void
}
```

#### 插桩点的选择逻辑

```cpp
struct InstrumentPoint {
    Instruction *insert_before;    // IRBuilder 在此指令前插入 call
    uint32_t field_id;             // 字段 ID
    Value *gep_value;              // GEP 指针操作数（用于 __record_field_access_full）
    int is_write;                  // 0=读(load), 1=写(store), 2=memcpy/memset
};
```

| GEP 形态 | insert_before | gep_value | 说明 |
|----------|--------------|-----------|------|
| `GetElementPtrInst`（独立指令） | GEP 指令本身 | GEP 指令 | `IRBuilder(GEP)` 在 GEP 前插入 |
| `ConstantExpr GEP`（嵌入 store/load 操作数） | 该 store/load 指令 | ConstantExpr GEP | 常量表达式不是指令，插入在 user 指令前 |

`is_write` 判定逻辑（基于 user instruction 类型）：

| User 指令 | is_write | 说明 |
|-----------|----------|------|
| `store` | 1 | 写操作 |
| `load` | 0 | 读操作 |
| `memcpy` / `memset` | 2 | 批量传输 |
| 独立 GEP（检查 users） | 遍历 users 决定 | 若无 store/memcpy user 则默认 0 |

#### 新旧插桩 IR 对比

```llvm
; ===== 旧版：仅传 field_id =====
call void @__record_field_access(i32 1)
store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4)

; ===== 新版：传 field_id + 地址 + 读写标记 =====
call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1)
store float 2.0, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4)
```

新版调用同时保留：
- 原有共现计数逻辑（`__record_field_access` → 窗口 + 上三角矩阵）
- 新增追踪逻辑（`__record_field_access_full` → trace_buffer → trace.bin + access_trace.txt）

两条链路在运行时独立并行，互不干扰。

### 运行时库设计

`libaffinity` 使用固定大小的环形窗口和上三角共现矩阵，trace buffer 为首次调用时动态分配：

```
窗口大小：W = 16
最大字段数：MAX_FIELDS = 2048
矩阵大小：2048 × 2048 × 8 bytes ≈ 32 MB（静态分配）
trace buffer：默认 100 万条 × 28 bytes ≈ 28 MB（首次 malloc）

每次 __record_field_access(fid) / __record_field_access_full(fid, ptr, is_write)：
  1. 遍历窗口中已有字段，更新共现计数
  2. 将 fid 写入窗口当前位置
  3. （full 版本）将记录写入 trace buffer
  4. 若 trace_count >= TRACE_FLUSH_THRESHOLD → __flush_trace_chunk()
  5. 时间复杂度：O(W)

信号处理：
  SIGINT / SIGTERM → signal_handler → flush 剩余 trace + affinity → _exit(0)

程序退出时 dump：
  共现矩阵：只写非零的上三角元素 (a, b, count)，每条记录 12 bytes（3 × uint32_t）
  trace buffer：flush 剩余记录到最后一个 chunk
  典型输出：几 MB ~ 几十 MB
```

#### DFG 追踪接口（v2 新增）

`libaffinity` 同时提供带地址的追踪接口，用于生成数据流图（DFG）：

```c
void __record_field_access_full(uint32_t fid, void *ptr, int is_write);
// fid:      字段 ID（与 __record_field_access 一致）
// ptr:      实际运行时访问地址
// is_write: 0=读(load), 1=写(store), 2=memcpy/memset
```

每条调用记录在 `trace_buffer`（首次调用时 `malloc` 动态分配，默认容量 100 万条 ≈ 28 MB）中包含：

```
trace_record { ts(u64), fid(u32), addr(u64), is_write(i32), region(char) }
```

**轮转刷新机制**：当 `trace_count` 达到阈值 `TRACE_FLUSH_THRESHOLD`（默认 1000000）时，自动将缓冲区刷入 `trace.N.bin` + `access_trace.N.txt`（N 为 chunk 序号），然后重置缓冲区继续记录。长时运行程序不会丢失数据。

```bash
# 自定义 flush 阈值（每 5 万条刷一次）
TRACE_FLUSH_THRESHOLD=50000 ./test_struct
# 产出: trace.0.bin, trace.1.bin, ... (每 5 万条一个文件)
```

**地址段自动识别**：通过 linker symbol `__data_start` / `_end` 区分：
- `G`（global）：地址在 `.data`/`.bss` 段
- `H`（heap）：地址高于数据段且低于栈底
- `S`（stack）：地址在栈顶附近

程序退出时自动刷出剩余记录，输出文件：

| 文件 | 格式 | 用途 |
|------|------|------|
| `trace.0.bin`, `trace.1.bin`, ... | 二进制，28 bytes/条 | 供 `build_dfg.py` 程序化处理 |
| `access_trace.0.txt`, `access_trace.1.txt`, ... | 文本，`[ts] fid R/W addr region` | 人类可读的访存序列 |

示例 `access_trace.0.txt`：
```
[0] 0 W 0x404028 G
[1] 1 W 0x40402c G
[2] 2 W 0x404030 G
[3] 0 R 0x404028 G
[4] 0 W 0x404028 G
```

#### 信号安全退出与定时运行（v2.1 新增）

程序启动时自动注册 `SIGINT`（Ctrl+C）和 `SIGTERM`（kill）处理器，收到信号后会立即将内存中未 flush 的 trace 数据和 affinity 矩阵刷盘后安全退出，**不会丢失数据**。

```bash
# 正常 Ctrl+C 中断 → 自动 flush 所有未保存数据
./test_struct
^C  # → trace.N.bin + affinity.bin 已保存

# 定时运行 N 秒后自动退出并保存（不设则不限制运行时间）
TRACE_RUNTIME_SECONDS=30 ./test_struct
# → 运行 30 秒后 SIGALRM → flush → 退出

# 组合使用：小 chunk + 30 秒定时
TRACE_FLUSH_THRESHOLD=10000 TRACE_RUNTIME_SECONDS=30 ./test_struct
```

| 退出方式 | 数据安全 | 说明 |
|----------|:---:|------|
| 正常 exit() / return | ✅ | destructor 自动 flush |
| Ctrl+C (SIGINT) | ✅ | signal handler 拦截，flush 后 `_exit(0)` |
| kill (SIGTERM) | ✅ | 同上 |
| kill -9 (SIGKILL) | ⚠️ | 无法拦截，但已刷盘的 chunk 文件安全 |
| 程序崩溃 (Segfault) | ⚠️ | 无法拦截，但已刷盘的 chunk 文件安全 |

#### 采样率控制（v2.2 新增）

对于高频访存的大程序，全量记录会导致数据量过大。通过 `TRACE_SAMPLE_RATE` 环境变量可控制采样比例：

```bash
# 默认全量记录（SAMPLE_RATE=1）
./test_struct

# 仅记录 1% 的访问（每 100 次采样 1 次）
TRACE_SAMPLE_RATE=100 ./test_struct

# 仅记录 0.01% 的访问（高频 benchmark 推荐）
TRACE_SAMPLE_RATE=10000 ./test_struct
```

采样机制：函数入口使用原子计数器（多线程版）或普通计数器（单线程版）+ 取模判断。被跳过的调用仅走计数器 + 分支 return 快速路径（~1-10ns），不进入窗口/affinity/trace 逻辑。采样对 trace 和 affinity 一视同仁——被跳过的调用既不留 trace 也不影响共现矩阵。

#### 多线程兼容（v2.2 新增）

通过 `FIELDANALYSIS_MULTITHREAD` 编译宏区分单线程/多线程版本，**共享同一份源码**：

```bash
# 单线程编译（默认，零额外开销，不依赖 pthread）
cc -c libaffinity.c

# 多线程编译（带 pthread_mutex 同步 + 原子计数器）
cc -c libaffinity.c -DFIELDANALYSIS_MULTITHREAD
# 链接时需加 -lpthread
```

设计要点：

| 特性 | 单线程（默认） | 多线程（-DFIELDANALYSIS_MULTITHREAD） |
|---|---|---|
| 采样计数器 | 普通 `uint64_t` 自增 | `_Atomic uint64_t` 原子加 |
| 临界区保护 | 无（编译期消除） | `pthread_mutex_lock/unlock` |
| signal handler | 直接执行 | `pthread_mutex_trylock` 防死锁 |
| pthread 依赖 | 无 | 需要 `-lpthread` |

多线程模式下，signal handler 若无法获取 mutex（另一个线程正在临界区），会设置 `sig_terminate=1` 标志，持有锁的线程释放锁后检查标志并调用 `_exit(0)`。

### 数据流图（DFG）生成

`tools/build_dfg.py` 从 `trace.*.bin` 文件中读取访存时序记录，使用滑动窗口（W=10）按时间戳推进构建字段级共现图，输出 4 种 DOT 图。

**默认扫描模式**（无参数时自动扫描当前目录中所有 `trace.*.bin`）：

```bash
python3 tools/build_dfg.py                    # 扫描当前目录
python3 tools/build_dfg.py /path/to/traces/   # 扫描指定目录
python3 tools/build_dfg.py trace.0.bin        # 单文件（向后兼容）
```

**区间过滤**（`--start` / `--end` 截取记录子区间）：

```bash
python3 tools/build_dfg.py --start 1000000 --end 2000000  # 仅分析第 100 万 ~ 200 万条
python3 tools/build_dfg.py --end 100000                    # 仅分析前 10 万条
python3 tools/build_dfg.py --start 500000                  # 跳过前 50 万条
```

**容错特性**：
- 损坏文件（尾部截断）：警告后跳过尾部字节，继续处理其他文件
- 空文件：警告后跳过
- 缺失 `struct_layout.json`：降级使用原始 fid 数字作为节点标签
- 混合正常/损坏文件：跳过损坏文件，处理正常的

| 输出文件 | 数据源 | 说明 |
|---------|-------|------|
| `dfg_global.dot` | 仅 `region=G` 的记录 | 全局变量之间的数据流 |
| `dfg_heap.dot` | 仅 `region=H` 的记录 | 堆分配结构体的数据流 |
| `dfg_stack.dot` | 仅 `region=S` 的记录 | 栈变量之间的数据流 |
| `dfg_unified.dot` | 全部记录 | 汇总图，节点按 G/H/S 着色 |

unified 图节点着色：
- 蓝色（lightblue）：全局变量
- 红色（lightcoral）：堆变量
- 绿色（lightgreen）：栈变量

边权重表示两个字段在时间窗口内的共现次数，weight 越大表示访问亲和性越强。

### 结构体布局导出

Pass 编译期额外输出 `struct_layout.json`，包含所有结构体类型布局及变量实例信息（含源码位置）：

```json
{
  "structs": {
    "struct.Foo": {
      "size": 40,
      "fields": [
        {"idx": 0, "type": "i32",  "offset": 0,  "size": 4},
        {"idx": 1, "type": "float","offset": 4,  "size": 4},
        {"idx": 2, "type": "double","offset": 8,  "size": 8},
        {"idx": 3, "type": "[16 x i8]","offset": 16, "size": 16},
        {"idx": 4, "type": "i64", "offset": 32, "size": 8}
      ]
    }
  },
  "variables": {
    "global": [{"name": "g_foo", "type": "struct.Foo", "size": 40, "file": "/home/user/test_struct.c", "line": 10}],
    "heap_sites": [{"function": "heap_struct", "type": "struct.Foo", "size": 40, "file": "/home/user/test_struct.c", "line": 96}],
    "stack_vars": [{"function": "stack_struct", "type": "struct.Foo", "size": 40, "file": "/home/user/test_struct.c", "line": 42}]
  }
}
```

`"file"` 和 `"line"` 字段来自调试元数据（需 `-g` 编译），可精确定位源码位置：
- `global`：变量声明位置
- `heap_sites`：`malloc/calloc/realloc` 调用位置
- `stack_vars`：`alloca` 局部变量声明位置

`--field-analysis-only` 模式下也输出 `struct_layout.json`（与 `gep_field_map.json` 同时产出）。

### 输出文件格式

**`gep_field_map.json`**：
```json
{
  "函数名::BB名::指令序号": {
    "struct": "struct.Inner",
    "field": 1,
    "offset": 4,
    "id": 5,
    "source": {
      "file": "/home/user/test.c",
      "line": 42,
      "col": 15
    },
    "access_path": [
      {"struct": "struct.Outer", "field": 1, "field_offset": 4},
      {"struct": "struct.Inner", "field": 1, "field_offset": 4}
    ]
  }
}
```

字段说明：
- `struct`：叶子结构体名称（最深层的被访问结构体）
- `field`：叶子结构体中的字段索引
- `offset`：从基指针算起的绝对字节偏移（累加所有层级）
- `id`：全局唯一的字段标识符，用于运行时共现计数
- `source`：源码位置（需 `-g` 编译）
- `access_path`：完整的结构体访问路径，每一层记录结构体名、字段索引和该字段在结构体内的偏移

**`affinity.bin`**：二进制文件，每条记录 12 字节：
```
[uint32_t a][uint32_t b][uint32_t count]
```
`a < b`，只存储非零条目。

**`reorder.json`**：
```json
{
  "struct.Foo": [[2, 0], [1, 3, 4]],
  "struct.Bar": [[0, 1, 2]]
}
```
每个内层数组代表一个缓存行中的字段索引排列。

## 使用方法

> 完整的分步操作指南（含 opt 分步执行、一键 pipeline、脚本使用）请参阅 **[OPERATIONS.md](OPERATIONS.md)**。

### 构建

**方式一：树内构建（推荐）**

将 `FieldAnalysis` 目录放入 `llvm/lib/Transforms/` 下（已完成），然后构建 LLVM：

```bash
cmake -G Ninja \
      -DLLVM_ENABLE_PROJECTS="clang;lld" \
      -DLLVM_FIELDANALYSIS_LINK_INTO_TOOLS=ON \
      -DLLVM_ENABLE_RTTI=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      /mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/llvm
ninja -j10 opt clang lld
```

> **注意**：`-DLLVM_ENABLE_RTTI=ON` 是必须的。RTTI 关闭时独立构建的 `.so` 插件无法加载（`undefined symbol`），树内构建也建议开启以保持两种模式兼容。

**方式二：独立构建（Linux 动态加载插件）**

```bash
cmake -S FieldAnalysis -B FieldAnalysis/build \
      -DLLVM_DIR=<llvm-build>/lib/cmake/llvm
cmake --build FieldAnalysis/build

ln -sf /home/albaz/FieldAnalysis-build \
       /mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/build
```

### 运行

**步骤 1：编译 + 静态分析 + 插桩**

```bash
# 树内构建方式（-g 保留调试信息用于源码定位）
clang -g -O2 -flto -fpass-plugin=FieldAnalysis.so \
      your_program.c -o your_program \
      -L<FieldAnalysis>/runtime -laffinity

# 仅分析不插桩
clang -g -O2 -flto -fpass-plugin=FieldAnalysis.so \
      --field-analysis-only \
      your_program.c -o your_program
```

**步骤 2：运行程序**

```bash
./your_program [程序正常参数]
# 程序退出后自动生成 affinity.bin + trace.bin + access_trace.txt
```

**步骤 3a：离线共现分析（装箱）**

```bash
python3 tools/analyze.py [选项]

选项：
  --gep-map PATH     gep_field_map.json 路径（默认：当前目录）
  --affinity PATH    affinity.bin 路径（默认：当前目录）
  --output PATH      输出文件路径（默认：reorder.json）
  --cacheline N      缓存行大小（默认：64 字节）
```

**步骤 3b：数据流图（DFG）生成**

```bash
python3 tools/build_dfg.py [trace_dir] [output_dir]

# 示例：
python3 tools/build_dfg.py test/ test/
# 生成 dfg_global.dot, dfg_heap.dot, dfg_stack.dot, dfg_unified.dot

# 渲染为图片：
dot -Tpng dfg_unified.dot -o dfg_unified.png
```

### 端到端测试

```bash
cd FieldAnalysis/test

# 树内构建（默认）
OPT=/home/albaz/llvm-build/build-debug/bin/opt bash run_test.sh

# 独立构建（需 LLVM_ENABLE_RTTI=ON）
BUILD_MODE=plugin FA_BUILD_DIR=/home/albaz/FieldAnalysis-build bash run_test.sh
```

### 应用重排建议

`reorder.json` 输出的是每个结构体的字段重排建议。手动应用方式：

```c
// 原始结构体
struct Foo {
    int a;      // field 0
    float b;    // field 1
    double c;   // field 2
    char d[16]; // field 3
    long e;     // field 4
};

// 若 reorder.json 建议：[[2, 0], [1, 3, 4]]
// 表示：cacheline 0 放 field 2(c) 和 field 0(a)
//        cacheline 1 放 field 1(b), field 3(d), field 4(e)
// 重排后：
struct Foo {
    double c;   // field 2 → 偏移 0
    int a;      // field 0 → 偏移 8
    // padding 4 bytes
    float b;    // field 1 → 偏移 16
    char d[16]; // field 3 → 偏移 20
    long e;     // field 4 → 偏移 36
};
```

> **注意**：重排会改变结构体的内存布局，需要确保所有使用该结构体的代码同步更新。建议在性能测试中用 `perf stat -e cache-misses` 对比优化前后。

### 多文件 LTO 工作流

多文件项目需通过 LTO 合并所有翻译单元后再运行 pass，保证 field_id 全局一致：

```
file1.c ─flto─▶ file1.o ─┐
file2.c ─flto─▶ file2.o ─┼─ llvm-link ─▶ combined.ll ─▶ opt field-analysis ─▶ instrumented.ll ─▶ program
main.c  ─flto─▶ main.o  ─┘
```

```bash
clang -g -flto=thin -c file1.c file2.c main.c
llvm-link file1.o file2.o main.o -S -o combined.ll
opt -passes=field-analysis combined.ll -S -o instrumented.ll
clang instrumented.ll -o program -lruntime -Lruntime/
./program
```

runtime（`libaffinity.c`）是进程级单例，不参与 LTO 合并。所有文件的 struct 访问写入同一 `trace.0.bin`，DFG 自然反映跨文件共现。

## 文件结构

```
FieldAnalysis/
├── CMakeLists.txt              # 独立构建 CMake
├── FieldAnalysisPass.cpp       # LLVM Pass：分析 + 插桩
├── runtime/
│   ├── CMakeLists.txt          # 运行时库 CMake
│   ├── libaffinity.c           # 运行时共现计数 + DFG 追踪 + 信号处理
│   └── libaffinity.h           # 运行时库头文件
├── tools/
│   ├── analyze.py              # 离线分析 + 贪心装箱
│   └── build_dfg.py            # 数据流图（DFG）构建工具
└── test/
    ├── test_struct.c           # 测试程序（含多种数据结构）
    ├── run_test.sh             # 端到端测试脚本
    ├── gep_field_map.json      # Pass 输出：字段映射
    ├── struct_layout.json      # Pass 输出：结构体布局
    ├── trace.0.bin             # 运行时输出：访存追踪 chunk 0（二进制）
    ├── trace.1.bin             # 运行时输出：访存追踪 chunk 1（若超过阈值）
    ├── access_trace.0.txt      # 运行时输出：访存时序序列 chunk 0
    ├── affinity.bin            # 运行时输出：共现矩阵
    ├── reorder.json            # analyze.py 输出：重排建议
    ├── dfg_global.dot          # build_dfg.py 输出：全局变量 DFG
    ├── dfg_heap.dot            # build_dfg.py 输出：堆变量 DFG
    ├── dfg_stack.dot           # build_dfg.py 输出：栈变量 DFG
    └── dfg_unified.dot         # build_dfg.py 输出：统一 DFG

llvm/lib/Transforms/FieldAnalysis/
├── CMakeLists.txt              # 树内构建 CMake
└── FieldAnalysis.cpp           # 与独立版相同的 Pass 实现
```

## 完整数据流

```
源代码 → clang -fpass-plugin=FieldAnalysis.so → 插桩 IR + gep_field_map.json + struct_layout.json
                                                       │
                                                       ▼
                                            编译链接 → 可执行文件
                                                       │
                                                       ▼ 运行
                                            ┌──────────┴──────────────┐
                                            │                         │
                                       affinity.bin          trace.0.bin, trace.1.bin, ...
                                       (共现矩阵)               (访存时序序列 chunks)
                                            │              access_trace.0.txt, ...
                                            ▼                         │
                                      analyze.py              build_dfg.py
                                            │               ┌────────┬─┴──┬────────┐
                                       reorder.json         │        │     │        │
                                            │            dfg_     dfg_  dfg_   dfg_
                                            ▼           global  heap  stack unified
                                       结构体重排
```

## 迭代路线

| 阶段 | 内容 | 状态 |
|------|------|------|
| P0 | 路径A：StructType GEP 直读 + gep_type_iterator 全类型导航 | ✅ 已完成 |
| P1 | 插桩 + 运行时共现计数 | ✅ 已完成 |
| P2 | 离线分析 + 贪心装箱 | ✅ 已完成 |
| P3 | 路径B：i8 GEP + TBAA 元数据恢复 | ✅ 已完成 |
| P4 | ConstantExpr GEP 扫描 + 嵌套递归展开 + Def-Use 溯源兜底 | ✅ 已完成 |
| P5 | DFG 追踪：地址级访存序列 + global/heap/stack 分离数据流图 + struct_layout.json 导出 | ✅ 已完成 |
| P6 | 轮转 trace buffer + 信号安全退出 + TRACE_RUNTIME_SECONDS 定时运行 + build_dfg.py 区间过滤/容错增强 + struct_layout.json 源码定位 | ✅ 已完成 |
| P7 | 采样率控制（TRACE_SAMPLE_RATE）+ 多线程条件编译（FIELDANALYSIS_MULTITHREAD）| ✅ 已完成 |
