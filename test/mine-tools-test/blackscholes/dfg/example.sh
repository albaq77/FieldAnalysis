# 最简运行（串行 + plugin 模式）
bash run_blackscholes.sh

# 多线程模式（4 线程）
BS_MODE=pthreads NTHREADS=4 bash run_blackscholes.sh

# 树内构建模式
BUILD_MODE=in-tree OPT=/path/to/opt CLANG=/path/to/clang bash run_blackscholes.sh

# LTO 多文件工作流
BS_MODE=lto bash run_blackscholes.sh

# 带运行时控制（30 秒采样 + 1% 采样率）
TRACE_RUNTIME_SECONDS=30 TRACE_SAMPLE_RATE=100 bash run_blackscholes.sh

# 轻量级亲和性追踪（仅记录 field_id）
SIMPLE_ACCESS=1 bash run_blackscholes.sh

# 减少迭代次数以加速测试
NUM_RUNS=1 bash run_blackscholes.sh