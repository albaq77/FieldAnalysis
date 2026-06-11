#!/usr/bin/env bash
# FieldAnalysis - 逐个运行所有 test_suites 测试用例
# 用法: bash run_all.sh                      # 全量运行
#       bash run_all.sh --analysis-only      # 仅分析模式
#       bash run_all.sh --skip-external      # 跳过需要外部输入文件的测试
#       bash run_all.sh --dry-run            # 试运行
#       bash run_all.sh --steps 0-2          # 自定义步骤范围
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FA_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
FA_RUNNER="$FA_DIR/tools/fa_runner.py"

# ---------- 参数解析 ----------
ANALYSIS_ONLY=false
SKIP_EXTERNAL=false
DRY_RUN=false
EXTRA_ARGS=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --analysis-only) ANALYSIS_ONLY=true; shift ;;
        --skip-external) SKIP_EXTERNAL=true; shift ;;
        --dry-run)       DRY_RUN=true; shift ;;
        --steps)         EXTRA_ARGS="$EXTRA_ARGS --steps $2"; shift 2 ;;
        *)               EXTRA_ARGS="$EXTRA_ARGS $1"; shift ;;
    esac
done

# ---------- 测试套件列表 ----------
declare -A NEED_INPUT
NEED_INPUT["histogram"]=1
NEED_INPUT["histogram_input"]=1
NEED_INPUT["linear_regression"]=1
NEED_INPUT["string_match"]=1

TEST_SUITES=(
    "atomic_lock"
    "boost_test"
    "false"
    "histogram"
    "histogram_input"
    "linear_regression"
    "locked"
    "lockless"
    "lu_ncb"
    "string_match"
    "tensor"
    "tmi_boost/ref_count"
    "tmi_boost/spinlock"
)

# ---------- 统计 ----------
TOTAL=0
PASSED=0
FAILED=0
SKIPPED=0

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m'

if $ANALYSIS_ONLY; then
    EXTRA_ARGS="--analysis-only $EXTRA_ARGS"
    echo -e "${CYAN}>>> 模式: Analysis-Only (仅生成 JSON)${NC}"
else
    echo -e "${CYAN}>>> 模式: 全量运行 (编译 + 插桩 + 运行 + 分析)${NC}"
fi
echo ""

# ---------- 运行 ----------
N_TOTAL=${#TEST_SUITES[@]}

for dir in "${TEST_SUITES[@]}"; do
    TOTAL=$((TOTAL + 1))
    CONFIG_PATH="$SCRIPT_DIR/$dir/fa_test.json"

    if [[ ! -f "$CONFIG_PATH" ]]; then
        echo -e "${YELLOW}[$TOTAL/$N_TOTAL] $dir: SKIPPED (无 fa_test.json)${NC}"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    if $SKIP_EXTERNAL && [[ -n "${NEED_INPUT[$dir]:-}" ]]; then
        echo -e "${YELLOW}[$TOTAL/$N_TOTAL] $dir: SKIPPED (需要外部输入文件)${NC}"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    echo -e "${BLUE}============================================================${NC}"
    echo -e "${BLUE}[$TOTAL/$N_TOTAL] Running: $dir${NC}"
    echo -e "${GRAY}Config: $CONFIG_PATH${NC}"

    if $DRY_RUN; then
        echo -e "  ${GRAY}> python3 \"$FA_RUNNER\" --config \"$CONFIG_PATH\" $EXTRA_ARGS --dry-run${NC}"
        echo -e "${GREEN}[$TOTAL] $dir: DRYRUN${NC}"
        continue
    fi

    if python3 "$FA_RUNNER" --config "$CONFIG_PATH" $EXTRA_ARGS 2>&1; then
        echo -e "${GREEN}[$TOTAL] $dir: PASSED${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}[$TOTAL] $dir: FAILED (exit=$?)${NC}"
        FAILED=$((FAILED + 1))
    fi
    echo ""
done

# ---------- 汇总 ----------
echo -e "${BLUE}============================================================${NC}"
echo -e "                Test Suite 执行汇总"
echo -e "${BLUE}============================================================${NC}"
echo -e "总计:   $TOTAL"
echo -e "${GREEN}通过:   $PASSED${NC}"
echo -e "${RED}失败:   $FAILED${NC}"
echo -e "${YELLOW}跳过:   $SKIPPED${NC}"