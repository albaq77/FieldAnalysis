# v3 逻辑对象追踪使用说明

Linux 64 位、LLVM 22 `opt/llc`；前端 `clang` 产生禁用 LLVM 优化的 `-O1` IR。此模式只记录配置的目标对象范围，不是 v2 的全地址六字段采集，也不是硬件缓存跟踪。

```bash
python3 test/logical_trace/run_tests.py
python3 -m unittest discover -s test/logical_trace -p 'test_*.py' -v
python3 test/logical_trace/run_benchmarks.py

# 用自己的源码与配置采集（也可换成 tools/logical_runner.py）：
python3 tools/fa_runner.py --logical-config test/logical_trace/objects.json \
  --source test/logical_trace/objects.c --compare-stdout
```

通用入口可重复给出 `--source`，所有源码先通过 llvm-link 合并，再统一插桩。省略 `functions` 或配置 `[]` 时选择合并模块中全部可插桩函数；非空数组仅选择列出的 IR 函数名。对象必须显式配置。输入文件用 `--logical-input PATH` 复制到基线/采集目录，运行参数用 `--run-arg=ARG`，输出目录用 `--logical-output-dir DIR`；直接使用 `tools/logical_runner.py` 时对应参数为 `--input`、`--output-dir`。可通过 `--llvm-build`、`--clang` 指定工具链；直接入口还支持重复的 `--compile-flag=FLAG`、`--link-flag=FLAG`。

各入口创建独立 `/tmp/fieldanalysis-*` 输出目录，打印输出路径；`run_benchmarks.py` 运行原版 Phoenix 矩阵乘法与 Huron 4 线程回归，使用固定小输入、记录 commands.log、保存完整二进制/文本 trace、对象生命周期日志、状态以及与未插桩同源 IR 构建的 stdout 对照。指定 `--output-dir` 时目录必须为空。重跑前需有 LLVM 22 构建与 clang、cmake、cc。

筛选单个函数的配置示例为 `{"functions":["matrix_mult"],"objects":[{"kind":"heap","function":"main","callee":"mmap","ordinal":0,"name":"A","type":"i32","shape":[2,2]}]}`；`ordinal` 是同函数相同 allocator 的零基调用点序号，必须唯一匹配。支持 global `symbol`、入口块 stack `alloca`、显式 heap allocator 调用；堆多维 shape/字段名须人工配置，不能仅凭虚拟地址猜测。有关源到 IR 的编译及插桩完整命令见 benchmark 输出 `commands.log`。

已采集目录的处理示例：

```bash
python3 tools/export_trace.py /tmp/fieldanalysis-logical-EXAMPLE --require-complete --output /tmp/events.csv
python3 tools/build_access_graph.py /tmp/fieldanalysis-logical-EXAMPLE --window-ns 1000000000 --output /tmp/graph.json
python3 tools/project_layout.py /tmp/fieldanalysis-logical-EXAMPLE --candidate /tmp/candidate.json --output /tmp/projected.json
```

CSV 保留 v2 六字段及 v3 的 object_id、对象内偏移、多维逻辑下标和 field_path。访问图按时间原点（默认最早事件、可通过 `--origin-ns` 固定）切 `[T0+kΔ,T0+(k+1)Δ)`；同 run / phase 的每窗口内所有事件对都计数，self_pairs 单列，非自环无向边带 a/r/f/m 计数。没有自动推断 phase：实际 trace 均属 phase 0。

候选 JSON 示例（以实际 `objects.*.jsonl` 的 object_id 为准，每个有事件的对象必须列出）：

```json
{
  "objects": {
    "1": {"base": "0x100000", "extent": 32,
          "strides": [16, 4], "fields": {"value": 0}},
    "2": {"base": "0x200000", "extent": 32,
          "strides": [16, 4], "fields": {"value": 0}}
  }
}
```

不同对象候选地址区间必须不相交；相同对象中不同逻辑节点不能重叠。仅对完整标量访问投影，不把 range/partial 假装成单元素；它计算候选字节地址，不执行候选程序、不预测性能或 Hit/Miss。不能直接用旧 `build_dfg.py` / `resolve_trace.py` / `analyze.py` 处理 v3，它们会明确拒绝。
