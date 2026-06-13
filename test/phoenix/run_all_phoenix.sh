#!/bin/bash
# run_all_phoenix.sh
# One-by-one run all Phoenix benchmark variants using fa_runner.py
# Usage: bash run_all_phoenix.sh [--build-mode plugin|in-tree] [--dry-run]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FA_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
FA_RUNNER="$FA_DIR/tools/fa_runner.py"

BUILD_MODE="plugin"
DRY_RUN=""

for arg in "$@"; do
    case $arg in
        --build-mode) BUILD_MODE="$2"; shift 2 ;;
        --dry-run) DRY_RUN="--dry-run" ;;
    esac
done

echo "============================================"
echo "  Phoenix Benchmark Suite - Run All Tests"
echo "  FA_DIR: $FA_DIR"
echo "  Build Mode: $BUILD_MODE"
echo "============================================"

declare -A PHOENIX_TESTS
PHOENIX_TESTS=(
    ["histogram"]="serial pthreads mapreduce"
    ["kmeans"]="serial pthreads mapreduce"
    ["linear_regression"]="serial pthreads mapreduce"
    ["matrix_multiply"]="serial pthreads mapreduce"
    ["pca"]="serial pthreads mapreduce"
    ["reverse_index"]="serial pthreads mapreduce"
    ["string_match"]="serial pthreads mapreduce"
    ["word_count"]="serial pthreads mapreduce"
)

TOTAL=0
PASSED=0
FAILED=0

for test_dir in "${!PHOENIX_TESTS[@]}"; do
    config="$SCRIPT_DIR/$test_dir/fa_test.json"
    if [ ! -f "$config" ]; then
        echo "[SKIP] $test_dir: fa_test.json not found"
        continue
    fi

    for variant in ${PHOENIX_TESTS[$test_dir]}; do
        TOTAL=$((TOTAL + 1))
        echo ""
        echo "---- [$TOTAL] $test_dir / $variant ----"
        if python3 "$FA_RUNNER" --config "$config" --variant "$variant" --build-mode "$BUILD_MODE" $DRY_RUN; then
            PASSED=$((PASSED + 1))
            echo "[PASS] $test_dir / $variant"
        else
            FAILED=$((FAILED + 1))
            echo "[FAIL] $test_dir / $variant"
        fi
    done
done

echo ""
echo "============================================"
echo "  Phoenix Suite Complete: $TOTAL total, $PASSED passed, $FAILED failed"
echo "============================================"
