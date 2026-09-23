# FieldAnalysis

基于 LLVM New Pass Manager 的 Linux CPU 访存追踪与离线分析工具。
当前代码提供两种独立模式，使用同一插件和运行时：

| 模式 | 观察范围 | 输出与用途 |
| --- | --- | --- |
| v2 `field-analysis` | 输入 IR 中支持的访存指令 | 时间、虚拟地址、R/W/RMW、访问字节数、逻辑 CPU ID、OS TID；字段标签与旧亲和性分析 |
| v3 `logical-trace` | 配置对象范围内的访存 | v2 字段加对象实例、对象偏移、逻辑下标与字段路径；固定时间窗口访问图和候选布局地址投影 |

**未设置 `functions` 或设置为 `[]` 时，对输入模块内全部可插桩函数处理。**
非空列表按 LLVM IR 名称筛选；C++ 使用修饰后的名称。外部库的声明没有函数体，
不在覆盖范围。运行时保留名称 `__fa_*`、`__record_field_access*`
及标注 `fieldanalysis-runtime` 的函数始终排除，以防运行时自插桩。普通 `fa_*` 应用函数仍会插桩。
v3 仍必须显式配置 `objects`，全函数不等于全对象。

插桩以 load/store、原子操作和内存 intrinsic 为单位，不以 GEP 地址计算为事件。
类型和字段识别失败不会使 v2 漏掉普通访存。trace 是 IR 层观测，不能用于声称
已采集硬件全部访存、缓存命中率或已经获得性能收益。

## 构建与验证

依赖 Linux 64 位、LLVM 开发文件及 `opt`/`llc`/`llvm-link`、Clang、C/C++ 编译器、
CMake 3.20+、Python 3；运行时始终链接 pthread。当前验证环境为 LLVM 22 / AArch64。
插件必须与加载它的 LLVM 主版本和构建配置匹配；AddLLVM 继承 RTTI/EH 设置。

```bash
cmake -S . -B build -DLLVM_DIR=/path/to/llvm-build/lib/cmake/llvm
cmake --build build -j2

python3 test/run_all_tests.py --regressions \
  --llvm-build /path/to/llvm-build --fa-build-dir "$PWD/build"
```

在本项目位于 `llvm-project/workspace/FieldAnalysis` 时，回归测试默认使用
`../../build` 中的 LLVM，插件构建到 `/tmp/fieldanalysis-v2-build`。
测试结果与完整命令写入每次新建的 `/tmp/fieldanalysis-*` 目录。

## 使用入口

```bash
# v2：生成唯一来源的配置模板，然后修改源码路径和变体
python3 tools/fa_runner.py --template /path/to/project/fa.json
python3 tools/fa_runner.py --config /path/to/project/fa.json --dry-run

# v3：未设置 functions 的双源文件示例，先链接 IR 再插桩
python3 tools/logical_runner.py \
  --logical-config test/logical_trace/multifile.json \
  --source test/logical_trace/multifile_main.c \
  --source test/logical_trace/multifile_worker.c --compare-stdout
```

`fa.json` 与 `fa_test.json` 都可通过 `--config` 显式读取；测试自动发现约定使用
`fa_test.json`。v2 工程配置和 v3 对象选择配置是两种不同格式，不能互换。

- [配置与模板](docs/CONFIGURATION.md)：默认值、函数选择、变体和运行控制。
- [v2 使用说明](docs/TRACE_V2_USAGE.md)：手工 IR 流程、输出、迁移边界。
- [v3 使用说明](docs/LOGICAL_TRACE_USAGE.md)：对象选择、访问图和布局投影。
- [实现与协议](docs/TRACE_V2_DESIGN.md)：插桩时机、数据格式、完整性语义。
- [测试入口](test/README.md)：回归测试与可选 benchmark 的区别。
- [本次审查结果](docs/REVIEW.md)：修复、验证结果与剩余限制。

## 项目结构

```text
FieldAnalysisPass.cpp             类型识别、元数据与插件注册
FieldAnalysisInstrumentation.inc  v2 访存采集、共用筛选与属性修正
LogicalTraceInstrumentation.inc   v3 对象生命周期与访存采集
JsonWriter.h                     静态报告写入
runtime/                         TLS trace、对象登记与生命周期日志
tools/                           配置运行、读取、导出和离线分析
test/trace_v2/                   IR 夹具与 v2 端到端测试
test/logical_trace/              v3 测试、图/投影单测、小输入 benchmark
test/Huron/, test/phoenix/        可选 benchmark 源码与配置
test/mine-tools-test/            本地示例与扩展 benchmark
llvm/lib/Transforms/FieldAnalysis/ 树内构建适配，共用根目录实现
docs/                            当前实现对应的使用与设计文档
```

每次采集使用独立目录。默认全量采集可能产生大量数据，并显著改变线程调度和耗时。
`TRACE_SAMPLE_RATE>1`、采集时限、异常退出或丢失事件都不能声明完整。
完整性认证仅适用于已声明的插桩范围；使用 `export_trace.py --require-complete` 核验。
旧字段重排建议与 v3 候选地址投影都不自动改写应用，也不预测缓存性能。
