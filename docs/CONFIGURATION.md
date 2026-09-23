# 配置与模板

## v2 工程配置

`tools/fa_test_template.json` 是唯一模板来源。`fa_runner.py --template PATH`
复制它，已有文件不会被覆盖。文件名可为 `fa.json`；benchmark 自动发现只扫描 `fa_test.json`。

```json
{
  "name": "example",
  "source_dir": "src",
  "output_dir": "dfg",
  "functions": [],
  "trace": {"sample_rate": 1, "flush_threshold": 4096, "runtime_seconds": null},
  "variants": {
    "serial": {
      "opt_level": "O2",
      "sources": ["main.c"],
      "compile_flags": [],
      "link_flags": [],
      "run_args": []
    }
  }
}
```

| 字段 | 语义 |
| --- | --- |
| name/source_dir/variants | 必填；sources 相对 source_dir，其余项目路径相对配置所在目录 |
| output_dir | 默认 dfg；一次采集一个目录，不能混入旧 trace |
| default_variant | 省略时选择 variants 中第一个变体 |
| functions | 省略或 `[]` 选择全部可插桩 IR 函数；非空数组精确筛选；null/字符串/未知名称报错 |
| opt_level | 变体默认 O2；CLI `--opt-level` 优先；compile_flags 不得另放 -O 参数 |
| sources/compile_flags/link_flags/run_args | 每个变体必填的字符串数组；sources 非空 |
| lto / 变体 _lto | 显式启用 IR 合并；sources 多于一项时自动合并，不漏掉后续文件 |
| input_files/output_files | 名称到路径的映射；run_args 支持 `{名称}` 和 `{nthreads}` |
| pre_compile | 可选 shell 命令；替换 `{source_dir}` 和 `{test_dir}`；仅用于可信项目配置 |
| simple_access | 旧 affinity-only 模式，默认 false；不产生六字段 trace |
| multithread | 旧兼容字段；当前 runtime 始终支持线程并链接 pthread，不再控制构建宏 |

v2 对 clang 按 opt_level 生成的 IR 插桩；被优化或内联掉的源码函数没有独立的 IR 函数体，
所以 functions 选择的是此阶段的 IR 名称。要观察优化前逻辑对象，使用 v3。

## 采集参数

| trace 字段 | 环境变量 / CLI | 默认 |
| --- | --- | --- |
| sample_rate | TRACE_SAMPLE_RATE / --trace-sample | 1，全量 |
| flush_threshold | TRACE_FLUSH_THRESHOLD / --trace-flush | 每线程 4096 事件，上限 1048576 |
| runtime_seconds | TRACE_RUNTIME_SECONDS / --trace-seconds | 不限采集时长 |

优先级：CLI、配置非 null 值、继承环境、运行时默认。配置/CLI 非 null 值必须为正整数。
若要在配置 `runtime_seconds: null` 下确保不限时，需清除外部 `TRACE_RUNTIME_SECONDS`。
时限只停止采集，**不会终止应用**。应用超时由 benchmark 总入口的 `--timeout` 控制。
采样/限时采集不能标记完整；runtime 不安装 SIGALRM 或 SIGINT 刷盘处理器。
运行器将 `FA_TRACE_DIR` 固定为当前 output_dir，防止环境变量将 trace 写到其他目录。

## 运行器

```bash
python3 tools/fa_runner.py --config /path/to/fa.json \
  --opt /path/to/llvm-build/bin/opt \
  --llvm-link /path/to/llvm-build/bin/llvm-link \
  --llvm-dir /path/to/llvm-build/lib/cmake/llvm
```

插件由 opt 加载，必须与 opt 匹配。clang 用于前端和 v2 最终链接；混用版本需验证 IR 兼容性。
`CLANG`、`OPT`、`LLVM_LINK`、`LLVM_DIR`、`FA_BUILD_DIR` 可通过环境设置；CLI 优先。
已有插件目录会增量构建，不仅检查文件存在。

步骤：0 构建 runtime 与插件，1 产生 IR，2 仅静态分析，3 插桩，4 链接，
5 执行及标签解析，6 字段亲和性，7 旧 DFG。默认执行 0-7；显式 `--steps 8` 渲染，
`--steps 9` 显示。范围限整数 0-9，辅助步骤随对应整数一起执行。
多文件工作流的生成/合并/插桩/链接集中在步骤 1；`--analysis-only` 始终只生成静态分析，
不执行旧动态分析。失败或中断返回非零，不会被记录为通过。

`--build-mode in-tree` 仅适用于已经静态注册该 Pass 的 opt。仓库中的树内适配目录
还需接入 LLVM 的 CMake/PassBuilder 注册；单纯复制目录不会使任意 opt 识别 pass。
常规使用推荐动态插件路径。

## v3 对象配置

```json
{
  "objects": [{"kind": "global", "symbol": "shared", "name": "shared"}]
}
```

`functions` 省略或 `[]` 同样表示全部可插桩函数；`objects` 必须为非空数组。
`objects[].function` 是分配点/栈对象的定位条件，不是访存函数筛选。
运行器合并全部 `--source` 后匹配函数和对象，静态同名符号可能被 llvm-link 重命名，
应以 combined.ll 中的名称为准。v3 参数和选择器详见 [使用说明](LOGICAL_TRACE_USAGE.md)。
