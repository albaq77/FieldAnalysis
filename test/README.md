# 测试

## 正确性回归

```bash
python3 test/run_all_tests.py --regressions
# 显式工具链与插件构建目录
python3 test/run_all_tests.py --regressions \
  --llvm-build /path/to/llvm-build --fa-build-dir /tmp/fieldanalysis-build
```

依次执行 v2、v3 端到端测试、运行器单测及访问图/投影单测，任一失败返回非零。
每个端到端入口先构建当前源码，再使用独立临时目录，`commands.log` 和 `results.json`
记录命令与结果。不要将历史生成物作为本次通过证据。

| 入口 | 验证内容 |
| --- | --- |
| trace_v2/run_tests.py | 实际插件、访存事件/宽度/原子操作、线程/CPU/分块、默认函数范围、旧工具、损坏拒绝 |
| logical_trace/run_tests.py | 对象登记/地址复用/坐标、默认与显式函数筛选、多源文件覆盖、属性清理、通用运行器 |
| test_runner.py | 模板一致性、配置检查、LTO 仅分析、dry-run、失败与旧采集保护 |
| logical_trace/test_graph.py | 八事件 28 对黄金值、半开窗口、phase、四种通道 |
| logical_trace/test_project.py | 候选 stride 与身份、越界/重叠/缺失对象拒绝 |

可只执行 Python 单测：

```bash
python3 -m unittest discover -s test -p 'test_*.py' -v
python3 -m unittest discover -s test/logical_trace -p 'test_*.py' -v
```

## 小输入效果检查

```bash
python3 test/logical_trace/run_benchmarks.py
```

对 Phoenix 2x2 矩阵乘法与 Huron 4 线程回归执行未插桩基线和插桩版本，比较 stdout、
精确事件数、逻辑下标和线程数，认证完整 trace。输入由脚本生成，不依赖外部数据集。
这检查采集语义和应用输出，不是性能加速或缓存命中率测试。

## 可选 benchmark 配置

```bash
python3 test/run_all_tests.py --list
python3 test/run_all_tests.py --suite phoenix --dry-run
python3 test/run_all_tests.py --suite Huron --analysis-only --timeout 120
python3 test/run_all_tests.py --include-local --test test_struct --skip-run
```

默认扫描 Huron、Phoenix 和 locked；`--include-local` 纳入 mine-tools-test。
全套实际执行可能需要输入文件、额外依赖和较长时间；`--skip-external` 跳过缺失配置输入
的用例，`--timeout` 限制每个变体的总运行时间。`--dry-run` 只列命令，不能当作通过。
`run_all_tests.sh`、Huron/Phoenix 套件脚本都转发到同一 Python 入口。
旧 benchmark 的 `trace.runtime_seconds` 仅控制采集时长，不终止进程。
旧 `dfg/`、IR、二进制和 trace 不纳入 Git，源码与 JSON 配置保留。
