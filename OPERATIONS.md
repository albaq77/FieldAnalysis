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

## 通用测试运行器（fa_runner.py）

`tools/fa_runner.py` 是 FieldAnalysis 的**通用测试运行器**，将固定的 Pipeline（编译 → 插桩 → 运行 → 分析）与测试用例特定的配置分离。用户只需编写 JSON 配置文件即可运行任意 benchmark。

### 设计理念

```
                    fa_runner.py（固定 Pipeline）
                    ┌─────────────────────────────┐
   fa_test.json ──▶│ Step 0:   编译 runtime 库      │
  （测试配置）       │ Step 1:   clang → IR         │
                    │ Step 2:   opt → 分析 (JSON)   │
                    │ Step 3:   opt → 插桩          │
                    │ Step 4:   clang → 可执行文件   │
                    │ Step 5:   运行程序             │
                    │ Step 6:   analyze.py          │
                    │ Step 7:   build_dfg.py        │
                    │ Step 8:   渲染 DFG (可选)      │
                    │ Step 9:   展示结果             │
                    └─────────────────────────────┘
```

### 快速开始

```bash
# 在 FieldAnalysis 根目录下执行

# 运行 blackscholes（默认 serial 变体）
python3 tools/fa_runner.py --config test/blackscholes/fa_test.json

# 列出所有可用变体
python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --list

# 运行多线程变体（4 线程）
python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --variant pthreads --nthreads 4

# 运行 test_structs（多结构体综合测试）
python3 tools/fa_runner.py --config test/test_structs/fa_test.json

# 试运行：仅打印命令不执行
python3 tools/fa_runner.py --config test/test_structs/fa_test.json --dry-run

# 只运行指定步骤（例如仅运行和离线分析）
python3 tools/fa_runner.py --config test/test_structs/fa_test.json --steps 5-7

# 自动发现所有测试
python3 tools/fa_runner.py --discover

# 为新测试生成配置模板
python3 tools/fa_runner.py --template test/my_project/fa_test.json
```

### 命令行参数

| 参数 | 说明 | 示例 |
|------|------|------|
| `--config` / `-c` | JSON 配置文件路径 | `--config test/blackscholes/fa_test.json` |
| `--variant` / `-V` | 变体名称（默认使用配置中的 default_variant） | `--variant pthreads` |
| `--build-mode` / `-b` | 构建模式：`plugin`（默认）或 `in-tree` | `--build-mode in-tree` |
| `--opt-level` / `-O` | 优化级别（默认使用变体中的 `opt_level`） | `-O O0` |
| `--clang` | clang 路径 | `--clang /opt/llvm/bin/clang-19` |
| `--opt` | opt 路径（in-tree 模式） | `--opt /opt/llvm/bin/opt` |
| `--llvm-link` | llvm-link 路径（LTO 模式） | `--llvm-link /opt/llvm/bin/llvm-link` |
| `--fa-dir` | FieldAnalysis 根目录 | `--fa-dir /path/to/FieldAnalysis` |
| `--fa-build-dir` | Plugin 构建目录 | `--fa-build-dir /home/user/fa-build` |
| `--nthreads` / `-n` | 线程数（默认 1） | `-n 4` |
| `--steps` / `-s` | 步骤范围 | `-s 0-9`, `-s 5-7`, `-s 3` |
| `--simple-access` | 启用 `--simple-access-record`（仅 field_id） | `--simple-access` |
| `--analysis-only` | 仅分析不插桩，跳过步骤 3/4/5 | `--analysis-only` |
| `--trace-seconds` | TRACE_RUNTIME_SECONDS | `--trace-seconds 30` |
| `--trace-flush` | TRACE_FLUSH_THRESHOLD | `--trace-flush 50000` |
| `--trace-sample` | TRACE_SAMPLE_RATE | `--trace-sample 100` |
| `--dry-run` | 打印命令不执行 | `--dry-run` |
| `--discover` / `-d` | 发现所有测试 | `--discover` |
| `--list` / `-l` | 列出变体 | `--list` |
| `--template` / `-t` | 生成配置模板 | `--template test/xxx/fa_test.json` |

### 步骤编号

每个步骤对应固定的 Pipeline 阶段，`--steps N-M` 只运行指定范围的步骤：

| 步骤 | 操作 | 说明 |
|------|------|------|
| 0 | Build runtime | 编译 `libaffinity.a` |
| 0.5 | Build plugin | plugin 模式下编译 `FieldAnalysis.so`（仅 plugin） |
| 1 | Generate IR | `clang -S -emit-llvm` |
| 2 | Analysis-only | `opt -passes=field-analysis --field-analysis-only` → `{name}_analyzed.ll` + `gep_field_map.json` + `struct_layout.json` |
| 3 | Instrument | `opt -passes=field-analysis` → `{name}_instrumented.ll` + `gep_field_map.json` + `struct_layout.json` + 插桩验证 |
| 4 | Compile | `clang inst.ll + libaffinity.a` → 可执行文件 |
| 5 | Run | 执行插桩程序 → `trace.*.bin` + `affinity.bin` + `access_trace.*.txt`；**Ctrl+C 终止运行但保存已采集数据，自动继续后续分析步骤** |
| 5.5 | Resolve trace | 解析 `access_trace.*.txt` → `variable_trace.*.txt`（变量名 + 大小） |
| 6 | Analyze | `analyze.py` → `reorder.json` |
| 7 | Build DFG | `build_dfg.py` → `dfg_*.dot` |
| 8 | Render DFG | `dot -Tpng` → `dfg_*.png`（需 Graphviz） |
| 9 | Display | 打印 `gep_field_map.json`、`struct_layout.json`、`reorder.json`、trace 前 20 行 |

### 运行时中断（Ctrl+C）

Step 5（运行插桩程序）期间按下 Ctrl+C 时：

1. **C 运行时**（`libaffinity.c`）的 SIGINT handler 拦截信号 → 自动 flush trace buffer 到 `access_trace.*.txt` + 写入 `affinity.bin` → 安全退出
2. **Python 脚本**捕获 `KeyboardInterrupt` → 打印提示 → **不崩溃，继续执行 Step 5.5/6/7/8/9 的分析步骤**

因此你可以在采集到足够数据后手动 Ctrl+C 终止程序，脚本会自动处理剩余的分析流程，无需手动重新运行 `--steps 5.5-7`。

### 构建模式

`fa_runner.py` 支持两种构建模式，用法一致（变更 `--build-mode` 即可）：

| 模式 | Pipeline | 适用场景 |
|------|----------|---------|
| `plugin`（默认） | `clang→IR` → `opt+插件→pass` → `clang→exe` | LLVM 已安装，编译独立 .so |
| `in-tree` | `clang→IR` → `opt内置pass` → `clang→exe` | Pass 已编译进 opt |

LTO 多文件工作流通过 JSON 配置中的 `"lto": true` 或变体内的 `"_lto": true` 启用。

### JSON 配置格式

完整的 JSON 配置结构如下：

```json
{
    "name": "项目名称",
    "description": "测试描述",
    "source_dir": "src",
    "output_dir": "dfg",
    "default_variant": "serial",
    "lto": false,
    "multithread": false,
    "simple_access": false,
    "pre_compile": null,
    "input_files": {
        "input": "src/input.txt"
    },
    "output_files": {
        "output": "output.txt"
    },
    "trace": {
        "runtime_seconds": null,
        "flush_threshold": null,
        "sample_rate": null
    },
    "variants": {
        "serial": {
            "sources": ["main.c"],
            "opt_level": "O2",
            "compile_flags": [],
            "link_flags": ["-lm"],
            "run_args": ["{input}", "{output}"],
            "multithread": false,
            "pre_compile": null
        },
        "pthreads": {
            "sources": ["main_pthreads.c"],
            "opt_level": "O2",
            "compile_flags": ["-DENABLE_THREADS"],
            "link_flags": ["-lm", "-lpthread"],
            "run_args": ["{nthreads}", "{input}", "{output}"],
            "multithread": true,
            "pre_compile": null
        }
    }
}
```

### 配置字段说明

**顶层字段**：

| 字段 | 类型 | 必需 | 说明 |
|------|------|:---:|------|
| `name` | string | ✅ | 唯一标识符，用于命名中间产物 |
| `description` | string | | 人类可读描述 |
| `source_dir` | string | ✅ | 相对于 `fa_test.json` 的源码目录 |
| `output_dir` | string | | 输出目录（默认 `"dfg"`） |
| `default_variant` | string | | 默认变体名（默认 `"serial"`） |
| `lto` | bool | | 是否使用 LTO 多文件工作流 |
| `multithread` | bool | | 默认多线程开关（变体可覆盖） |
| `simple_access` | bool | | 对应 `--simple-access-record`：仅记录 field_id |
| `pre_compile` | string | | 编译前脚本（如 m4 展开），可用 `{source_dir}` `{test_dir}` |
| `input_files` | object | | 测试输入文件，在 `run_args` 中用 `{key}` 引用 |
| `output_files` | object | | 输出文件路径，在 `run_args` 中用 `{key}` 引用 |
| `trace` | object | | 默认 trace 设置：`runtime_seconds` / `flush_threshold` / `sample_rate` |
| `variants` | object | ✅ | 至少一个变体 |

**变体字段**：

| 字段 | 类型 | 必需 | 说明 |
|------|------|:---:|------|
| `sources` | string[] | ✅ | 源文件列表（相对于 `source_dir`） |
| `compile_flags` | string[] | ✅ | clang 编译参数（**不要包含 -O***，用下面的 `opt_level` 控制） |
| `link_flags` | string[] | ✅ | 链接参数 |
| `run_args` | string[] | ✅ | 运行参数，占位符 `{nthreads}` `{key}` |
| `opt_level` | string | | 优化级别 `O0`/`O1`/`O2`/`O3`（默认 `O2`） |
| `multithread` | bool | | 覆盖顶层 `multithread` |
| `pre_compile` | string | | 变体专属预处理命令（覆盖顶层） |
| `_lto` | bool | | 强制该变体使用 LTO 工作流 |

### 添加新测试

```bash
# Step 1: 生成配置模板
python3 tools/fa_runner.py --template test/new_project/fa_test.json

# Step 2: 编辑 fa_test.json
#   - 修改 name、source_dir
#   - 填写 sources、compile_flags、link_flags
#   - 配置 run_args 占位符
#   - 如有多个变体自定义 variants

# Step 3: 试运行验证
python3 tools/fa_runner.py --config test/new_project/fa_test.json --dry-run

# Step 4: 正式运行
python3 tools/fa_runner.py --config test/new_project/fa_test.json
```

### 环境变量

| 变量 | 用途 | 默认 |
|------|------|------|
| `CLANG` | clang 路径 | `clang` |
| `OPT` | opt 路径 | `opt` |
| `LLVM_LINK` | llvm-link 路径（LTO） | `llvm-link` |
| `BUILD_MODE` | 构建模式 | `plugin` |
| `PLUGIN_EXT` | 插件后缀 | Linux `.so`, macOS `.dylib`, Windows `.dll` |
| `FA_BUILD_DIR` | 插件构建目录 | `{fa_dir}/build` |
| `LLVM_DIR` | LLVM cmake 目录 | 自动推断 |
| `RUNTIME_CC` | runtime 编译器 | `cc` |

### 已有的测试用例

| 测试 | 配置文件 | 变体 | 说明 |
|------|---------|------|------|
| blackscholes | `test/blackscholes/fa_test.json` | serial, pthreads, simd | PARSEC Black-Scholes 基准测试 |
| test_structs | `test/test_structs/fa_test.json` | serial | 4 结构体 × 全局/栈/堆/嵌套/数组 综合测试 |

### 与旧脚本的对比

| 特性 | `run_test.sh` | `fa_runner.py` |
|------|:---:|:---:|
| 平台 | bash 脚本 | Python 跨平台 |
| 配置方式 | 环境变量 | JSON 配置文件 |
| 多变体 | 手动改脚本 | `--variant` 切换 |
| 步骤选择 | 不支持 | `--steps N-M` |
| 试运行 | 不支持 | `--dry-run` |
| 自动发现 | 不支持 | `--discover` |
| LTO | 不支持 | `"lto": true` |
| 产物验证 | 无 | `_verify_instrumentation` + `_verify_json_output` |
| 模板生成 | 需手动写 | `--template` |

***

## 测试脚本使用（旧版 run_test.sh）

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
| `variable_trace.0.txt`, `variable_trace.1.txt`, ... | 变量访问序列（`struct.field R/W size region`，由 `resolve_trace.py` 生成） |

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

