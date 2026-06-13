# FieldAnalysis 测试报告

## 概述

本报告汇总了 FieldAnalysis 工具链对 **7 大测试套件、33 个测试用例、73 个变体** 的完整测试内容。测试覆盖了从简单伪共享基准到复杂真实应用（Phoenix MapReduce、Huron 多线程套件、dwarves 结构体分析）的多种场景，验证了 FieldAnalysis 在结构体字段级数据流分析、伪共享检测、运行时追踪、地址映射等方面的能力。

---

## 测试框架说明

参考 [False Sharing Benchmark.pdf] 和 [Agent CPU 端调用工具清单.pdf] 中的测试方法论，本测试框架包含以下维度：

| 维度 | 说明 |
|------|------|
| **静态分析** | 编译期通过 LLVM Pass 分析 IR，提取结构体字段信息、生成 GEP 字段映射 |
| **运行时追踪** | 插桩后运行程序，采集字段级内存访问序列（时间戳、地址、读写类型） |
| **地址映射** | 将运行时地址映射到编译期结构体字段，处理堆/栈地址复用 |
| **DFG 构建** | 基于字段访问序列构建数据流图，可视化字段间依赖关系 |
| **伪共享检测** | 分析多线程下相邻缓存行字段的竞争模式 |

---

## 优化级别调整说明

### 调整原则

| 优化级别 | 适用场景 | 原因 |
|----------|----------|------|
| **O0** | 纯静态分析测试（无运行时追踪） | 保留完整结构体和 GEP 指令，不被 SROA/Mem2Reg 消除；保留所有 TBAA 元数据 |
| **O1** | 运行时追踪测试 | 保留结构体信息的同时启用基本优化，确保 TBAA 元数据完整，避免 O2 的 SROA 激进消除结构体 |

### 调整详情

| 套件 | 原优化级别 | 新优化级别 | 调整原因 |
|------|-----------|-----------|----------|
| **dwarves** | O0 | O0（不变） | 纯静态分析，需保留 36 种复杂结构体的完整 IR |
| **test_structs** | O2 | **O0** | 纯静态分析，O2 下 SROA 会消除嵌套结构体，导致 GEP 消失 |
| **False_Sharing** | O1 | O1（不变） | 运行时追踪，O1 保留结构体信息 |
| **fs_bench** | O1 | O1（不变） | 运行时追踪，7 种伪共享场景 |
| **sharing_bench** | O1 | O1（不变） | 运行时追踪，全局/栈/堆多实例 |
| **blackscholes** | O1 | O1（不变） | 运行时追踪，PARSEC 真实应用 |
| **Phoenix (8个)** | O2 | **O1** | 运行时追踪，O2 的 SROA 会消除 MapReduce 结构体字段 |
| **Huron (11个)** | O2 | **O1** | 运行时追踪，多线程伪共享检测需要完整结构体 |
| **Huron/false** | O2 | **O0** | 无运行时追踪，纯静态分析 |
| **Huron/atomic_lock** | O2 | **O0** | 无运行时追踪，纯静态分析 |
| **spring_2020_tutorial (8个)** | O2 | **O1** | 运行时追踪，缓存效应分析需要字段级信息 |
| **cache-effects** | O2 | **O1** | 运行时追踪，缓存步幅/伪共享/一致性测试 |
| **locked** | O2 | **O1** | 运行时追踪，带 mutex 的伪共享测试 |

---

## 测试用例详细说明

### 一、伪共享专项测试（False_Sharing）

| 项目 | 内容 |
|------|------|
| **测试名称** | `false_sharing_simple` |
| **优化级别** | O1 |
| **测试目的** | 验证 FieldAnalysis 对经典伪共享场景的检测能力 |
| **测试内容** | 两个线程在兄弟超线程上竞争相邻数组元素 |
| **关键指标** | 字段访问频率、缓存行冲突、地址映射正确性 |
| **追踪时长** | 30 秒 |
| **多线程** | 是 |

---

### 二、缓存效应测试（cache-effects）

| 项目 | 内容 |
|------|------|
| **测试名称** | `cache_effects` |
| **优化级别** | O1 |
| **测试目的** | 验证不同缓存访问模式下的字段级分析能力 |
| **变体** | |
| `cache_strides` | 单线程缓存步幅测试，验证不同步长对缓存命中率的影响 |
| `false_sharing_bench` | 多线程伪共享基准（Google Benchmark），验证竞争检测 |
| `cache_coherence` | 多线程缓存一致性测试，验证跨核数据同步的字段追踪 |
| **追踪时长** | 30 秒 |

---

### 三、dwarves 结构体字段分析

| 项目 | 内容 |
|------|------|
| **测试名称** | `dwarves` |
| **优化级别** | O0 |
| **测试目的** | 验证 FieldAnalysis 对复杂结构体的静态分析能力 |
| **测试内容** | 模拟 dwarves (pahole) v1.31 项目中的 36 种结构体类型，包括： |
| | - `cu`, `tag`, `class`, `type`, `function` 等核心类型 |
| | - 嵌套继承（如 `class` 继承自 `type`，`type` 继承自 `tag`） |
| | - `list_head` 双向链表节点 |
| | - `rb_node` 红黑树节点 |
| | - 位域字段（bitfields） |
| | - 柔性数组成员（flexible arrays） |
| | - 函数指针表 `ptr_table` |
| **关键指标** | GEP 字段映射完整性、结构体布局正确性、嵌套字段偏移计算 |
| **运行时追踪** | 否（纯静态分析） |

---

### 四、locked 带锁伪共享测试

| 项目 | 内容 |
|------|------|
| **测试名称** | `locked` |
| **优化级别** | O1 |
| **测试目的** | 验证在 pthread mutex 保护下的字段访问分析 |
| **变体** | |
| `toy` | 相邻 int 在锁区域内竞争（伪共享） |
| `toy_manual` | 缓存行对齐修复版本（步长 64） |
| **追踪时长** | 30 秒 |

---

### 五、Phoenix MapReduce 套件（8 个测试）

Phoenix 是斯坦福大学的 MapReduce 框架实现，本套件测试 FieldAnalysis 在真实并行计算框架下的分析能力。

| 测试名称 | 变体 | 优化级别 | 测试目的 |
|----------|------|----------|----------|
| `phoenix_histogram` | serial, pthreads, mapreduce | O1 | 直方图统计中的字段访问模式 |
| `phoenix_kmeans` | serial, pthreads, mapreduce | O1 | K-Means 聚类中的共享数据结构 |
| `phoenix_linear_regression` | serial, pthreads, mapreduce | O1 | 线性回归中的矩阵字段访问 |
| `phoenix_matrix_multiply` | serial, pthreads, mapreduce | O1 | 矩阵乘法中的数据并行字段 |
| `phoenix_pca` | serial, pthreads, mapreduce | O1 | PCA 降维中的协方差矩阵字段 |
| `phoenix_reverse_index` | serial, pthreads, mapreduce | O1 | 反向索引构建中的链表字段 |
| `phoenix_string_match` | serial, pthreads, mapreduce | O1 | 字符串匹配中的哈希表字段 |
| `phoenix_word_count` | serial, pthreads, mapreduce | O1 | 词频统计中的 MapReduce 结构体 |

**通用配置**：
- 编译标志：`-D_LINUX_`
- 追踪时长：30 秒
- mapreduce 变体使用 LTO 链接时优化

---

### 六、Huron 多线程伪共享套件（11 个测试）

Huron 套件专注于多线程伪共享的检测与修复验证。

| 测试名称 | 变体 | 优化级别 | 测试目的 |
|----------|------|----------|----------|
| `false` | false_c, false_unrolling | **O0** | 纯静态分析：16 线程竞争相邻 int / 4 线程手动展开 |
| `atomic_lock` | serial | **O0** | 纯静态分析：原子自旋锁的顺序访问模式 |
| `boost_test` | spinlock_pool, spinlock_pool_manual | O1 | Boost 风格自旋锁池的伪共享检测 |
| `histogram` | hist_pthread, hist_pthread_manual | O1 | 直方图结构体字段伪共享（thread_arg_t） |
| `histogram_input` | hist_pthread | O1 | 带输入数据的直方图伪共享 |
| `linear_regression` | lr_pthread, lr_pthread_manual | O1 | 线性回归的 aligned_alloc 填充修复 |
| `locked` | toy, toy_manual | O1 | mutex 保护下的伪共享 |
| `lockless` | toy, toy_manual | O1 | 无锁伪共享（无 mutex 的相邻 int） |
| `lu_ncb` | lu, lu_manual | O1 | SPLASH-2 LU 非连续块分解（追踪 120 秒） |
| `string_match` | sm_pthread, sm_pthread_manual | O1 | 字符串匹配 MapReduce 结构体伪共享 |
| `tensor` | serial | O1 | Eigen Tensor 线程池张量操作伪共享（追踪 60 秒） |
| `tmi_boost/spinlock` | serial | O1 | Boost 自旋锁池在共享缓冲区上的竞争 |
| `tmi_boost/ref_count` | serial | O1 | Boost shared_ptr 引用计数伪共享 |

**说明**：`false` 和 `atomic_lock` 的 `runtime_seconds` 为 null，属于纯静态分析测试，因此使用 O0 保留完整结构体信息。

---

### 七、Spring 2020 Tutorial 套件（8 个测试）

该套件来自 2020 年春季的计算机体系结构教程，覆盖多种底层硬件效应。

| 测试名称 | 变体 | 优化级别 | 测试目的 |
|----------|------|----------|----------|
| `s20_false_sharing` | false_sharing_bench, aligned_type, atomic_int, vary_thread | O1 | 伪共享的多种变体：对齐类型、原子变量、变线程数 |
| `s20_branch_prediction` | vf_calls, vf_size | O1 | 虚函数调用的分支预测效应 |
| `s20_code_scheduling` | fast_mod | O1 | 快速取模的代码调度优化 |
| `s20_associativity` | l1_bench, llc_bench | O1 | L1/LLC 缓存关联度测试 |
| `s20_lto` | single_tu, multi_tu | O1 | 链接时优化的矩阵乘法 |
| `s20_matrix_vector` | mv_bench, mv_bench_aligned, mv_bench_avx, read_bench | O1 | 矩阵-向量乘法的对齐与 AVX 优化 |
| `s20_prefetching` | prefetching | O1 | 多种预取策略（行优先、反向、列优先、随机） |
| `s20_sso` | sso_bench, sso_demo | O1 | 小字符串优化（SSO）的内存布局分析 |

---

### 八、mine-tools-test 工具验证测试（4 个，不纳入批量测试）

这些测试用于验证 FieldAnalysis 工具链本身的功能正确性，不纳入 `run_all_tests.py` 的批量执行。

| 测试名称 | 优化级别 | 测试目的 |
|----------|----------|----------|
| `test_structs` | **O0** | 验证多结构体（全局/栈/堆/嵌套/数组）的静态分析正确性 |
| `complex_fs_bench` | O1 | 7 种伪共享场景的综合验证 |
| `sharing_bench` | O1 | 伪共享/真共享/无共享三种模式的对比验证 |
| `blackscholes` | O1 | PARSEC Black-Scholes 真实应用的完整流水线验证 |

---

## 测试产物

每个测试用例执行完成后，在 `dfg/` 输出目录下生成以下产物：

| 产物文件 | 说明 |
|----------|------|
| `gep_field_map.json` | 编译期 GEP 指令到结构体字段的映射 |
| `struct_layout.json` | 结构体布局信息（字段偏移、大小） |
| `access_trace.*.txt` | 运行时字段访问序列（时间戳、地址、读写类型） |
| `variable_trace.*.txt` | 解析后的变量名访问序列 |
| `address_map.json` | 运行时地址到结构体字段的时间分段映射 |
| `reorder.json` | 字段重排序建议（伪共享优化） |
| `dfg_*.dot` | 数据流图（Graphviz DOT 格式） |

---

## 一键执行方式

### 全部测试

```bash
# 从 FieldAnalysis 根目录执行（完整 pipeline，含运行时追踪）
python3 test/run_all_tests.py

# 指定构建模式
python3 test/run_all_tests.py --build-mode plugin

# 试运行（仅打印命令）
python3 test/run_all_tests.py --dry-run

# 跳过运行时追踪（仅编译+插桩+分析，最快）
python3 test/run_all_tests.py --skip-run

# 设置每个变体的超时时间（秒），超时自动跳过
python3 test/run_all_tests.py --timeout 120

# 仅静态分析（不插桩不运行）
python3 test/run_all_tests.py --analysis-only

# 将所有输出保存到日志文件
python3 test/run_all_tests.py > log.txt 2>&1
```

### 单个套件

```bash
python3 test/run_all_tests.py --suite phoenix
python3 test/run_all_tests.py --suite Huron
python3 test/run_all_tests.py --suite spring_2020_tutorial
python3 test/run_all_tests.py --suite cache-effects
python3 test/run_all_tests.py --suite dwarves
```

### 单个测试

```bash
python3 test/run_all_tests.py --test histogram
python3 test/run_all_tests.py --test blackscholes
```

### 列出所有测试

```bash
python3 test/run_all_tests.py --list
```

### 单独执行某个测试（使用 fa_runner.py）

```bash
python3 tools/fa_runner.py --config test/dwarves/fa_test.json
python3 tools/fa_runner.py --config test/False_Sharing/fa_test.json
```

### run_all_tests.py 参数说明

| 参数 | 说明 |
|------|------|
| `--suite` / `-s` | 只执行指定套件目录下的测试 |
| `--test` / `-t` | 只执行名称包含指定字符串的测试 |
| `--build-mode` / `-b` | 构建模式：`plugin`（默认）或 `in-tree` |
| `--dry-run` | 仅打印命令不执行 |
| `--analysis-only` | 仅静态分析（Step 0-2），不插桩不运行 |
| `--skip-run` | 跳过运行时追踪（Step 0-4），仅编译+插桩+分析 |
| `--timeout` | 每个变体的超时时间（秒），超时自动跳过继续下一个 |
| `--list` / `-l` | 列出所有可用测试用例 |
| `--fa-dir` | FieldAnalysis 根目录路径 |
| `--clang` / `--opt` / `--llvm-link` | 指定编译器工具链路径 |

### 预估执行时间

| 模式 | 预估耗时 | 说明 |
|------|----------|------|
| `--skip-run` | ~5-10 分钟 | 仅编译+插桩，71 个变体 |
| `--analysis-only` | ~3-5 分钟 | 仅静态分析 |
| 完整 pipeline | ~40-50 分钟 | 含运行时追踪（30-120 秒/变体） |
| `--timeout 120` | ~20-30 分钟 | 含超时保护 |

---

## 测试统计汇总

| 套件 | 测试用例数 | 变体总数 | 优化级别 | 追踪 |
|------|-----------|---------|----------|------|
| False_Sharing | 1 | 1 | O1 | 是 |
| cache-effects | 1 | 3 | O1 | 是 |
| dwarves | 1 | 1 | O0 | 否 |
| locked | 1 | 2 | O1 | 是 |
| Phoenix | 8 | 24 | O1 | 是 |
| Huron | 11 | 22 | O1/O0 | 部分 |
| spring_2020_tutorial | 8 | 18 | O1 | 是 |
| **合计** | **31** | **71** | - | - |

> 注：mine-tools-test 下的 4 个测试（含 8 个变体）不纳入批量测试统计。

---

## 关键测试结论

1. **O0 优化级别** 适用于纯静态分析场景，能完整保留结构体 IR 和 TBAA 元数据，确保 GEP 字段映射的完整性。

2. **O1 优化级别** 在保留结构体信息的同时启用基本优化，是运行时追踪测试的最佳选择。相比 O2，O1 不会触发 SROA 激进消除结构体，确保插桩覆盖所有字段访问。

3. **dwarves 测试** 验证了 FieldAnalysis 对 36 种复杂结构体（含嵌套继承、链表、红黑树、位域、柔性数组）的静态分析能力。

4. **Phoenix 和 Huron 套件** 验证了 FieldAnalysis 在真实多线程应用中的伪共享检测和字段级数据流分析能力。

5. **地址映射机制** 通过时间分段处理堆/栈地址复用，确保同一物理地址在不同时间段的语义正确映射。
