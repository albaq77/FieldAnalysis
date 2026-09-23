# Trace v2：构建、执行与读取

当前设计：[实现与协议](TRACE_V2_DESIGN.md)。验证结果：[审查记录](REVIEW.md)。

## 已实现的输出

| 用户信息 | 字段 | 定义 |
|---|---|---|
| 时间 | timestamp_ns | CLOCK_MONOTONIC_RAW 的纳秒数，回调观测时刻 |
| 地址 | address | 当前程序的实际虚拟字节地址 |
| 读写类型 | mode | R、W、RMW；cmpxchg 失败为 R，成功为 RMW |
| 大小 | access_size | 该条 IR 访存覆盖的字节数；内存 intrinsic 为动态区间长度 |
| 核 | cpu_id | 回调执行时的逻辑 CPU；配套 cpu_topology CSV 映射 package/die/core |
| 线程 | os_tid | Linux TID；thread_instance 区分同一运行的线程实例 |

附加 run_id/pid/thread_seq/module_id/site_id/fid/flags。事件唯一键为 `(run_id,pid,thread_instance,thread_seq)`。模块/site 描述静态访存位置，不表示对象生命周期。

## 一条命令构建并验收

从 FieldAnalysis 根目录执行（本环境为 AArch64）：

```bash
python3 test/trace_v2/run_tests.py
```

默认使用 `../../build` 的 LLVM22，插件构建到 `/tmp/fieldanalysis-v2-build`，每次测试使用新的临时目录。最终打印检查数量、输出目录和插件位置；详细命令在输出目录的 `commands.log`。指定 `--output-dir` 时必须使用空目录，避免历史 trace 混入。

```bash
python3 test/trace_v2/run_tests.py \
  --llvm-build /workspace/Ascend-env/llvm-project/build \
  --build-dir /tmp/fieldanalysis-v2-build
```

当前验收结果见 [审查记录](REVIEW.md)。测试覆盖 LLVM22/AArch64、GCC11 构建插件、RTTI/EH OFF。C 源码用系统 clang19 生成的简单文本 IR 经 opt22/llc22 验证；这不是 clang19/LLVM22 全面兼容承诺。不能把 LLVM22 插件加载到 clang19。

## 手工分步学习

```bash
FA_ROOT=/workspace/Ascend-env/llvm-project/workspace/FieldAnalysis
LLVM_BUILD=/workspace/Ascend-env/llvm-project/build
FA_BUILD=/tmp/fieldanalysis-v2-build

cmake -S "$FA_ROOT" -B "$FA_BUILD" \
  -DLLVM_DIR="$LLVM_BUILD/lib/cmake/llvm" -DCMAKE_BUILD_TYPE=Release
cmake --build "$FA_BUILD" -j2

# 使用独立空目录；这些命令会生成 metadata 和 trace。
mkdir -p /tmp/my-fieldanalysis-example
cd /tmp/my-fieldanalysis-example
"$LLVM_BUILD/bin/opt" \
  -load-pass-plugin="$FA_BUILD/FieldAnalysis.so" \
  -passes=field-analysis -verify-each -debug-pass-manager \
  -S "$FA_ROOT/test/trace_v2/multi.ll" -o instrumented.ll

"$LLVM_BUILD/bin/llc" -filetype=obj -relocation-model=pic \
  instrumented.ll -o main.o
cc main.o "$FA_BUILD/runtime/libaffinity.a" -pthread -o main
TRACE_SAMPLE_RATE=1 TRACE_FLUSH_THRESHOLD=4096 ./main

python3 "$FA_ROOT/tools/export_trace.py" . \
  --output events.csv --require-complete
```

应该输出同一地址的三条 R/W/R，各 4 B。仅有 GEP 的 `geponly.ll` 不产生回调；`scalar.ll` 的无结构体访存产生两条 W/R。

当前默认管线也已接入 `registerOptimizerLastEPCallback`，可使用 `-passes='default<O1>'`。显式 `field-analysis` 仍然可用；重复调度按指令 metadata 跳过已插桩访存。`--field-analysis-only` 不改变 IR，可对其输出继续插桩。必须使用原始未插桩 IR 重新采集；旧 v1 标记与 v2 不应混用。

插件代码会为新增 I/O、同步与地址捕获清理过时的 memory/nofree/nosync/captures 等属性，并返回 PreservedAnalyses::none()。类型识别沿用旧 helper；实际插桩集中在 `FieldAnalysisInstrumentation.inc`。

## 文件与协议

- `trace.<pid>.<run>.<thread>.<chunk>.bin`：32 B 文件头 + 80 B 小端事件，无 C struct padding 依赖。
- `access_trace.<pid>.<run>.<thread>.<chunk>.txt`：带 `#FA_TRACE_V2` 头的 CSV；与二进制字段等价。
- `trace_status.<pid>.<run>.<thread>.0.json`：每线程 observed/emitted/sampled_out/lost/io_errors、chunk 数和结束状态。
- `trace_run.<pid>.<run>.0.0.json`：正常进程退出标记、线程数、退出时未完成线程数。
- `cpu_topology.<pid>.<run>.0.0.csv`：逻辑 CPU 到 package/die/core 的 sysfs 快照；不可用值为 -1。不代表已经采集缓存共享域。
- `access_sites.<module_id>.json`：访问点、opcode、观测位置、flags 和静态 unsupported 数。
- `gep_field_map.<module_id>.json`、`struct_layout.<module_id>.json`：每模块元数据。无后缀文件只是旧单模块工具的兼容别名。

flags：atomic=1、volatile=2、after-instruction=4、range-summary=8、time/CPU observation error=16。默认前置普通访存表示“将尝试执行”；cmpxchg 为后置，以观察 success。

`--require-complete` 核对正常退出、线程结束、事件数量、线程序号、采样/丢失、观测错误和已有模块静态覆盖报告。它证明的是声明范围内的观测流完整性，不证明捕获未插桩库、信号处理、内联汇编或硬件生成的全部访存。

## 参数与迁移注意

| 参数 | v2 行为 |
|---|---|
| FA_TRACE_DIR | 输出目录，必须预先存在；默认当前目录 |
| TRACE_SAMPLE_RATE | 每线程保留每 N 次合格访问中的一次，默认 1；大于 1 不可标完整 |
| TRACE_FLUSH_THRESHOLD | 每线程 chunk 容量，默认 4096，上限 1048576；同步刷盘，有采集扰动 |
| TRACE_RUNTIME_SECONDS | 仅限制采集时长，不再安装 SIGALRM 或强制结束应用；截断采集标记 limited |
| --simple-access-record | 旧字段亲和性模式，无六字段 trace |

旧二进制/文本 trace 仍可解析；缺少的时间、大小、CPU、线程显示为空，不能从字段声明或旧序号伪造。旧 `__record_field_access_full` ABI 因无访问大小，只保留 affinity 功能；需要重新编译插桩程序来产生 v2。

v2 普通采集不再在热路径更新全局亲和性矩阵；`analyze.py` 会离线从 v2 构造旧的 16 事件窗口字段亲和性。`build_dfg.py` 仍是旧字段共现图，并非文档的固定时间窗口 FS 图。二者只接受单 run/module，拒绝混合身份；所有事件的原始导出使用 export_trace。v2 的 G/H/S 区域暂记 U（unknown），避免旧地址范围启发式误判。

`resolve_trace.py` 保留六字段并附加字段标签；其输出已改为带表头 CSV（保留 `.txt` 文件名兼容发现逻辑），`--keep-timestamps` 保留为兼容参数。字段声明大小另列 declared_field_size，不替代 access_size。

## 当前边界

支持 Linux 64 位默认地址空间 CPU 访存。scalable vector、masked/gather/scatter 等需专门展开的 intrinsic，以及非默认地址空间会计入 unsupported；普通外部库函数内部访存不由本模块自动覆盖。memcpy/memmove 是源/目的区间摘要，不是内部机器访问顺序。

线程应正常 join 后结束进程。SIGKILL、崩溃、`_exit`、退出时仍活跃的线程不保证尾块完整，缺少/不完整 footer 会被拒绝。runtime 不安装信号处理器；异步信号处理内的插桩和初始化后 fork 不支持，后者显式报错退出。正常线程析构会刷尾块，进程末尾析构 priority 101 刷主线程。每个已注册线程保留少量状态到进程结束，buffer 在线程结束释放。

CPU/时间记录的是回调观测值；绑定线程能降低迁移不确定性，但记录顺序不等于硬件全局顺序。数据是 IR 访存，后端 spill、预取、库内部访问和设备访存另行处理。运行时开销和拓扑缓存共享域校准仍需后续性能研究。

对象身份、生命周期、shape/strides 和固定窗口访问图已经由独立 [v3 模式](LOGICAL_TRACE_USAGE.md) 实现。v2 的 fid 和 address_map 不应当作动态对象身份。缓存回放和 Hit/Miss 预测尚未实现。
