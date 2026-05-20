# FieldAnalysis 操作手册

本文档提供两种编译方式下完整的操作流程：独立分步执行和脚本一键执行。

## 环境依赖

> 以下所有版本要求基于 **LLVM 19**。低版本 LLVM 不保证兼容。

### 必需依赖

| 依赖 | 最低版本 | 说明 |
|------|---------|------|
| **LLVM 19** | 19.x | 树内构建放入 `llvm/lib/Transforms/`，独立构建通过 `LLVM_DIR` 指定 |
| **CMake** | ≥ 3.20.0 | 构建系统 |
| **C++ 编译器** | GCC 7.4 / Clang 5.0 | 需支持 C++17（编译 FieldAnalysisPass.cpp） |
| **Ninja** | ≥ 1.5 | 推荐构建生成器（`-G Ninja`） |
| **Python 3** | ≥ 3.8 | 运行 `tools/analyze.py` 和 `tools/build_dfg.py` |
| **clang** | LLVM 19 配套 | 编译、插桩、链接 |
| **opt** | LLVM 19 配套 | 树内模式运行 pass（插件模式不需要） |
| **ar** | 系统自带 | 打包运行时库 `libaffinity.a` |
| **bash** | ≥ 3.0 | `run_test.sh` 执行环境 |

### 可选依赖

| 依赖 | 用途 |
|------|------|
| **lld** | LTO 多文件链接（可用 GNU ld 替代） |
| **llvm-link** | LTO 合并 bitcode |
| **pthread** | 多线程安全（`-DFIELDANALYSIS_MULTITHREAD -lpthread`） |
| **Graphviz (dot)** | 渲染 DFG 图片（`dot -Tpng dfg_*.dot -o dfg_*.png`） |

### 关键编译选项

| 选项 | 值 | 说明 |
|------|---|------|
| `LLVM_ENABLE_RTTI` | **必须 `ON`** | 关闭时 `.so` 插件加载失败（`undefined symbol`） |
| `LLVM_ENABLE_PROJECTS` | `clang;lld` | 必须包含 clang |

### LLVM 组件依赖

独立构建 `find_package(LLVM)` 时需确保以下组件已编译：

```
core  support  analysis  passes  transformutils  irreader
```

如果缺少组件，cmake 配置阶段会报错提示。

### 操作系统

开发测试于 **Linux (x86_64)**。macOS 需设置 `PLUGIN_EXT=.dylib`。Windows 未充分测试。

***

## 方式一：树内构建（opt + pass 集成）

> 适用于已将 `FieldAnalysis` 放入 `llvm/lib/Transforms/` 的用户。Pass 集成在 `opt` 中，无需动态加载 `.so`。

### 编译

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

> `-DLLVM_ENABLE_RTTI=ON` 是必须的：RTTI 关闭时独立构建的 `.so` 插件无法加载（`undefined symbol: _ZTIN4llvm2cl18GenericOptionValueE`）。树内构建也建议开启以保持两种模式兼容。

### 分步执行（逐步验证）

```bash
# === Step 1：生成未优化的 LLVM IR ===
clang -g -O2 -S -emit-llvm test_struct.c -o test_struct.ll

# === Step 2：运行 FieldAnalysis pass（仅分析，不插桩）===
opt -passes=field-analysis --field-analysis-only -S test_struct.ll \
    -o test_struct_analyzed.ll
# 产出: gep_field_map.json + struct_layout.json

# === Step 3：运行 FieldAnalysis pass（分析 + 插桩）===
opt -passes=field-analysis -S test_struct.ll \
    -o test_struct_instrumented.ll
# 产出: gep_field_map.json + struct_layout.json + 插桩 IR

# === Step 4：编译运行时库 ===
cd FieldAnalysis/runtime
clang -c libaffinity.c -o libaffinity.o
ar rcs libaffinity.a libaffinity.o

# === Step 5：编译插桩后的 IR 并链接运行时库 ===
clang test_struct_instrumented.ll -o test_struct \
    -L../runtime -laffinity
# 或直接指定 .a 文件路径：
# clang test_struct_instrumented.ll ../runtime/libaffinity.a -o test_struct

# === Step 6：运行插桩程序 ===
./test_struct
# 产出: affinity.bin + trace.bin + access_trace.txt

# === Step 7：离线分析 ===
python3 ../tools/analyze.py
# 产出: reorder.json

# 默认扫描当前目录所有 trace.*.bin 文件，合并生成 DFG
python3 ../tools/build_dfg.py

# 或显式指定目录
python3 ../tools/build_dfg.py .

# 区间过滤：仅分析第 10 万 ~ 50 万条记录
python3 ../tools/build_dfg.py --start 100000 --end 500000

# 仅分析前 10 万条
python3 ../tools/build_dfg.py --end 100000
```

### 一键执行（完整 pipeline）

```bash
# 生成 IR + pass 分析 + 插桩（三合一）
clang -g -O2 -fpass-plugin=FieldAnalysis.so \
      test_struct.c -o test_struct \
      -LFieldAnalysis/runtime -laffinity
# 产出: gep_field_map.json + struct_layout.json + test_struct

# 运行程序（可选：设置运行参数）
./test_struct
# 或带参数：
# TRACE_RUNTIME_SECONDS=30 ./test_struct
# TRACE_FLUSH_THRESHOLD=50000 ./test_struct
# 产出: affinity.bin + trace.0.bin + access_trace.0.txt

# 离线分析
python3 FieldAnalysis/tools/analyze.py
# 默认扫描当前目录所有 trace.*.bin 文件，合并生成 DFG
python3 FieldAnalysis/tools/build_dfg.py

# 或显式指定目录
python3 FieldAnalysis/tools/build_dfg.py .

# 区间过滤：仅分析第 10 万 ~ 50 万条记录
python3 FieldAnalysis/tools/build_dfg.py --start 100000 --end 500000

# 仅分析前 10 万条
python3 FieldAnalysis/tools/build_dfg.py --end 100000
```

> **注意**：`-fpass-plugin=FieldAnalysis.so` 仅适用于**独立构建**的 `.so`。
> 树内构建方式请使用 `opt -passes=field-analysis` 分步执行。

***

## 方式二：独立构建（动态加载 .so 插件）

> 适用于不想重新编译整个 LLVM 的用户。编译独立的 `FieldAnalysis.so` 插件。
>
> **⚠️ 前置条件**：LLVM 必须启用 RTTI（`LLVM_ENABLE_RTTI=ON`）。若 `grep LLVM_ENABLE_RTTI` 为 `OFF`，该方式不可用，请使用方式一。

### 编译插件

```bash
# Step 1：清理旧产物
rm -rf FieldAnalysis/build

# Step 2：在 Linux 本地目录构建（避免 /mnt/hgfs 共享文件系统的符号链接问题）
cmake -S FieldAnalysis \
      -B /home/albaz/FieldAnalysis-build \
      -DLLVM_DIR=/home/albaz/llvm-build/build-debug/lib/cmake/llvm
cmake --build /home/albaz/FieldAnalysis-build

# Step 3：运行时库编译
cd FieldAnalysis/runtime
clang -c libaffinity.c -o libaffinity.o
ar rcs libaffinity.a libaffinity.o
cd ../..
```

### 分步执行

```bash
# === Step 1：生成 LLVM IR ===
clang -g -O2 -S -emit-llvm test_struct.c -o test_struct.ll

# === Step 2：opt 加载 .so 插件运行 pass ===
opt -load-pass-plugin=/home/albaz/FieldAnalysis-build/FieldAnalysis.so \
    -passes=field-analysis -S test_struct.ll \
    -o test_struct_instrumented.ll

# === Step 3：仅分析模式 ===
opt -load-pass-plugin=/home/albaz/FieldAnalysis-build/FieldAnalysis.so \
    -passes=field-analysis --field-analysis-only -S test_struct.ll \
    -o test_struct_analyzed.ll

# === Step 4：编译插桩 IR + 链接运行时库 ===
clang test_struct_instrumented.ll -o test_struct \
    -LFieldAnalysis/runtime -laffinity

# === Step 5：运行 ===
./test_struct

# === Step 6：分析 ===
cd FieldAnalysis/test
python3 ../tools/analyze.py
# 默认扫描当前目录所有 trace.*.bin 文件，合并生成 DFG
python3 ../tools/build_dfg.py

# 或显式指定目录
python3 ../tools/build_dfg.py .

# 区间过滤：仅分析第 10 万 ~ 50 万条记录
python3 ../tools/build_dfg.py --start 100000 --end 500000

# 仅分析前 10 万条
python3 ../tools/build_dfg.py --end 100000
```

### 一键执行

```bash
# 设置 build 目录环境变量
export FA_BUILD_DIR=/home/albaz/FieldAnalysis-build

# 编译 + 插桩 + 链接（clang 直接加载 .so）
clang -g -O2 \
      -fpass-plugin=${FA_BUILD_DIR}/FieldAnalysis.so \
      test_struct.c -o test_struct \
      -LFieldAnalysis/runtime -laffinity

# 运行（可选：设置运行参数）
./test_struct
# 或带参数：
# TRACE_RUNTIME_SECONDS=30 ./test_struct
# TRACE_FLUSH_THRESHOLD=50000 ./test_struct
# 产出: affinity.bin + trace.0.bin + access_trace.0.txt

# 分析
python3 FieldAnalysis/tools/analyze.py
# 默认扫描当前目录所有 trace.*.bin 文件，合并生成 DFG
python3 FieldAnalysis/tools/build_dfg.py

# 或显式指定目录
python3 FieldAnalysis/tools/build_dfg.py .

# 区间过滤：仅分析第 10 万 ~ 50 万条记录
python3 FieldAnalysis/tools/build_dfg.py --start 100000 --end 500000

# 仅分析前 10 万条
python3 FieldAnalysis/tools/build_dfg.py --end 100000
```

***

## 测试脚本使用

`test/run_test.sh` 封装了完整的分步流程（编译 → 插桩 → 运行 → 分析）：

```bash
cd FieldAnalysis/test

# 默认使用 PATH 中的 clang
bash run_test.sh

# 指定 clang 路径
CLANG=/home/albaz/llvm-build/build-debug/bin/clang bash run_test.sh

# 指定插件构建目录（避免 /mnt/hgfs 共享文件夹的符号链接问题）
FA_BUILD_DIR=/home/albaz/FieldAnalysis-build bash run_test.sh
```

脚本会依次执行：

1. `clang -fpass-plugin` 编译 + 插桩 → 生成 `test_struct`、`gep_field_map.json`、`struct_layout.json`
2. 运行 `test_struct` → 生成 `affinity.bin`、`trace.bin`、`access_trace.txt`
3. `analyze.py` → 生成 `reorder.json`
4. `build_dfg.py` → 生成 4 个 DOT 文件

***

## 运行时环境变量

以下环境变量控制运行时的行为，在 `./test_struct` 执行前设置即可生效：

### TRACE_FLUSH_THRESHOLD

控制 trace buffer 的 flush 阈值（默认 1000000 = 100 万条）。buffer 满时自动刷入 `trace.N.bin` + `access_trace.N.txt` 并重置继续记录，长时运行不丢数据。

```bash
# 默认：每 100 万条 flush 一次（约 28 MB/文件）
./test_struct

# 每 5 万条 flush 一次（适合长时间运行的程序）
TRACE_FLUSH_THRESHOLD=50000 ./test_struct

# 每 1000 条 flush 一次（适合测试验证）
TRACE_FLUSH_THRESHOLD=1000 ./test_struct
```

| 环境变量 | 默认值 | 说明 |
|---------|--------|------|
| `TRACE_FLUSH_THRESHOLD` | 1000000 | trace buffer 刷新阈值（条数） |

### TRACE_RUNTIME_SECONDS

设置程序的运行时长（秒）。到时间后自动 flush 所有数据并退出。**不设置则不限制运行时**。

```bash
# 运行 30 秒后自动退出并保存数据
TRACE_RUNTIME_SECONDS=30 ./test_struct

# 组合：小 chunk + 30 秒定时
TRACE_FLUSH_THRESHOLD=10000 TRACE_RUNTIME_SECONDS=30 ./test_struct
```

| 环境变量 | 默认值 | 说明 |
|---------|--------|------|
| `TRACE_RUNTIME_SECONDS` | 无（不限时） | 程序运行 N 秒后自动退出 |

### 信号安全退出

程序启动时自动注册 `SIGINT`（Ctrl+C）和 `SIGTERM`（kill）处理器：

```bash
# 运行中按 Ctrl+C → 自动 flush 所有未保存数据
./test_struct
^C
# 输出: trace.0.bin + access_trace.0.txt + affinity.bin（数据完整）

# kill 终止也会保存
./test_struct &
kill $!
# 输出同上
```

| 退出方式 | 数据安全 | 说明 |
|----------|:---:|------|
| 正常退出 | ✅ | destructor 自动 flush |
| Ctrl+C / kill | ✅ | signal handler 拦截并 flush |
| kill -9 / 崩溃 | ⚠️ | 已刷盘的 chunk 安全，内存中未 flush 的丢失 |

### 阈值与时间的配合策略

| 场景 | 推荐配置 | 原因 |
|------|---------|------|
| 短测试程序 | 默认（不设） | 程序自然结束，一次性 flush |
| 长时 benchmark | `TRACE_RUNTIME_SECONDS=N` | 精确控制采样时长 |
| 极高频率访存 | `TRACE_FLUSH_THRESHOLD=500000` | 降低单文件大小，防止 OOM |
| 低频访存程序 | `TRACE_RUNTIME_SECONDS=N TRACE_FLUSH_THRESHOLD=10000` | 定时 + 小 chunk 双重保障 |
| 高采样率降数据量 | `TRACE_SAMPLE_RATE=100` | 仅 1% 访问记录，数据量降至 1/100 |
| 高频 benchmark | `TRACE_SAMPLE_RATE=10000 TRACE_FLUSH_THRESHOLD=10000` | 稀疏采样 + 小 chunk |

### TRACE_SAMPLE_RATE

控制运行时采样率（默认 1 = 全量记录）。函数入口使用计数器 `n++ % sample_rate` 判断是否进入记录逻辑：

```bash
# 全量记录（默认）
./test_struct

# 仅记录 1% 的调用（每 100 次采样 1 次）
TRACE_SAMPLE_RATE=100 ./test_struct

# 仅记录 0.01% 的调用（高频访存 benchmark 推荐）
TRACE_SAMPLE_RATE=10000 ./test_struct

# 组合：采样 + 小 chunk + 定时
TRACE_SAMPLE_RATE=100 TRACE_FLUSH_THRESHOLD=10000 TRACE_RUNTIME_SECONDS=30 ./test_struct
```

| 环境变量 | 默认值 | 说明 |
|---------|--------|------|
| `TRACE_SAMPLE_RATE` | 1 | 采样率，N=1 全量，N=100 为 1%，最大约 2^63 |

**采样语义**：被跳过的调用既不写入 trace buffer，也不更新滑动窗口和 affinity 矩阵——trace 和 affinity 被一视同仁地降采样。

### 多线程编译（FIELDANALYSIS_MULTITHREAD）

通过条件编译宏切换单线程/多线程版本：

```bash
# 单线程编译（默认，零额外开销）
cd FieldAnalysis/runtime
cc -c libaffinity.c -o libaffinity.o
ar rcs libaffinity.a libaffinity.o

# 多线程编译（带 pthread_mutex + 原子计数器）
cc -c libaffinity.c -DFIELDANALYSIS_MULTITHREAD -o libaffinity.o
ar rcs libaffinity.a libaffinity.o
# 链接时需加 -lpthread

# run_test.sh 一键切换
MULTITHREAD=1 bash run_test.sh
```

***

## 多文件工程（LTO）

Pass 按模块分配 field_id，多文件项目需通过 LTO 将所有翻译单元合并为一个 Module 后再运行 pass，确保 field_id 全局一致且能捕获跨文件的结构体访问。

### 原理

```
file1.c ──clang -flto=thin──▶ file1.o (bitcode)
file2.c ──clang -flto=thin──▶ file2.o (bitcode)
main.c  ──clang -flto=thin──▶ main.o  (bitcode)
                                    │
                          llvm-link ─┴──▶ combined.ll (单一 Module)
                                              │
                                    opt -passes=field-analysis
                                              │
                                   instrumented.ll (全局 field_id 已分配)
                                              │
                              clang + libaffinity.a
                                              │
                                        program
```

### 操作步骤

```bash
# Step 1: 每个 .c 编译为 LTO bitcode
clang -g -flto=thin -c src/file1.c -o obj/file1.o
clang -g -flto=thin -c src/file2.c -o obj/file2.o
clang -g -flto=thin -c src/main.c  -o obj/main.o

# Step 2: 链接所有 bitcode 为一个 .ll
llvm-link obj/file1.o obj/file2.o obj/main.o -S -o combined.ll

# Step 3: 在合并后的全集上运行 pass
opt -passes=field-analysis combined.ll -S -o instrumented.ll

# Step 4: 编译插桩后的 IR + 链接 runtime
clang instrumented.ll -o program -LFieldAnalysis/runtime -laffinity

# Step 5: 运行
./program

# Step 6: 分析（与单文件一致）
python3 tools/build_dfg.py
python3 tools/analyze.py
```

### 环境变量（与单文件一致）

```bash
TRACE_RUNTIME_SECONDS=30 TRACE_FLUSH_THRESHOLD=100000 ./program
```

### 注意事项

- 编译时需 `-g` 保留调试信息，否则 struct_layout.json 无 `file`/`line`
- 去掉单个 `.o` 的 `-flto=thin` 会导致 `llvm-link` 失败
- LTO 模式下整个程序的 struct 访问合并分析，DFG 会反映跨文件的字段共现关系
- runtime（`libaffinity.c`）本身不要参与 LTO 合并——它用普通 `cc` 编译，最后链接即可

***

## 产物一览

### 编译期产出（Pass 阶段）

| 文件                   | 生成条件 | 用途                               |
| -------------------- | ---- | -------------------------------- |
| `gep_field_map.json` | 始终生成 | 每个 GEP 指令 → 字段 ID 映射表            |
| `struct_layout.json` | 始终生成 | 所有结构体布局 + global/heap/stack 变量实例 |

### 运行期产出（程序执行阶段）

| 文件                 | 说明                             |
| ------------------ | ------------------------------ |
| `affinity.bin`     | 共现矩阵（上三角，字段两两访问次数）             |
| `trace.0.bin`, `trace.1.bin`, ... | 访存时序追踪轮转文件（二进制，28 bytes/条，默认每 100 万条一个文件） |
| `access_trace.0.txt`, `access_trace.1.txt`, ... | 访存序列（人类可读：`[ts] fid R/W addr region`） |

### 离线分析产出

| 文件                | 工具             | 说明            |
| ----------------- | -------------- | ------------- |
| `reorder.json`    | `analyze.py`   | 贪心装箱后的缓存行重排建议 |
| `dfg_global.dot`  | `build_dfg.py` | 全局变量数据流图      |
| `dfg_heap.dot`    | `build_dfg.py` | 堆变量数据流图       |
| `dfg_stack.dot`   | `build_dfg.py` | 栈变量数据流图       |
| `dfg_unified.dot` | `build_dfg.py` | 统一数据流图（三色区分）  |

### DOT 渲染

```bash
# 安装 Graphviz
sudo apt install graphviz    # Debian/Ubuntu
sudo yum install graphviz    # RHEL/CentOS

# 渲染
dot -Tpng dfg_unified.dot -o dfg_unified.png
dot -Tsvg dfg_unified.dot -o dfg_unified.svg
```

***

## 常用参数速查

### 编译期 flags（Pass）

| flag                      | 作用                          | 示例                                                 |
| ------------------------- | ----------------------------- | -------------------------------------------------- |
| `--field-analysis-only`   | 仅分析输出 JSON，不插桩        | `opt -passes=field-analysis --field-analysis-only` |
| `--simple-access-record`  | 仅记录 `field_id`（无地址/region），轻量级亲和性专用 | `opt -passes=field-analysis --simple-access-record` |

### 运行时环境变量

| 变量 | 默认 | 说明 |
|------|------|------|
| `TRACE_FLUSH_THRESHOLD` | 1000000 | trace buffer 刷新阈值（条数），超出自动轮转文件 |
| `TRACE_RUNTIME_SECONDS` | 无 | 定时运行 N 秒后自动 flush 退出 |
| `TRACE_SAMPLE_RATE` | 1 | 采样率，N=1 全量，N=100 为 1% |

### 脚本变量

| 变量 | 说明 |
|------|------|
| `FA_BUILD_DIR` | 独立构建时指定 .so 所在目录 |
| `CLANG` | 指定 clang 可执行文件路径 |
| `OPT` | 指定 opt 可执行文件路径（树内构建） |
| `BUILD_MODE` | `in-tree`（默认）或 `plugin`（独立构建） |
| `MULTITHREAD` | `1` 开启多线程编译（`-DFIELDANALYSIS_MULTITHREAD -lpthread`），默认 0 |

### build_dfg.py 参数

| 参数 | 说明 | 示例 |
|------|------|------|
| `path`（可选） | 目录路径或 .bin 文件，默认 `.` | `build_dfg.py` / `build_dfg.py /tmp/traces/` |
| `--start N` | 跳过前 N 条记录 | `--start 1000000` |
| `--end N` | 仅处理到第 N 条记录 | `--end 500000` |

