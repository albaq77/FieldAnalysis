#!/bin/bash
# run_all_tests.sh
# Master script: one-by-one run ALL FieldAnalysis benchmark suites
# Usage: bash run_all_tests.sh [--build-mode plugin|in-tree] [--dry-run]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FA_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FA_RUNNER="$FA_DIR/tools/fa_runner.py"

BUILD_MODE="plugin"
DRY_RUN=""
EXTRA_ARGS=""

for arg in "$@"; do
    case $arg in
        --build-mode) BUILD_MODE="$2"; shift 2 ;;
        --dry-run) DRY_RUN="--dry-run" ;;
    esac
done

if [ "$DRY_RUN" != "" ]; then
    EXTRA_ARGS="--dry-run"
fi

echo "########################################################################"
echo "#  FieldAnalysis - Complete Benchmark Suite Runner"
echo "#  FA_DIR: $FA_DIR"
echo "#  Build Mode: $BUILD_MODE"
echo "########################################################################"

SUITE_TOTAL=0
SUITE_PASSED=0
SUITE_FAILED=0

run_suite() {
    local suite_name="$1"
    local suite_script="$2"
    local suite_dir="$3"

    echo ""
    echo "########################################################################"
    echo "#  Suite: $suite_name"
    echo "########################################################################"

    if [ -f "$suite_script" ]; then
        bash "$suite_script" --build-mode "$BUILD_MODE" $EXTRA_ARGS
        local rc=$?
        SUITE_TOTAL=$((SUITE_TOTAL + 1))
        if [ $rc -eq 0 ]; then
            SUITE_PASSED=$((SUITE_PASSED + 1))
            echo "[SUITE PASS] $suite_name"
        else
            SUITE_FAILED=$((SUITE_FAILED + 1))
            echo "[SUITE FAIL] $suite_name"
        fi
    else
        echo "[SUITE SKIP] $suite_name: runner script not found at $suite_script"
    fi
}

# === False_Sharing (single test, run directly) ===
echo ""
echo "########################################################################"
echo "#  Suite: False_Sharing (simple)"
echo "########################################################################"
FS_CONFIG="$SCRIPT_DIR/False_Sharing/fa_test.json"
if [ -f "$FS_CONFIG" ]; then
    SUITE_TOTAL=$((SUITE_TOTAL + 1))
    if python3 "$FA_RUNNER" --config "$FS_CONFIG" --variant "default" --build-mode "$BUILD_MODE" $EXTRA_ARGS; then
        SUITE_PASSED=$((SUITE_PASSED + 1))
        echo "[SUITE PASS] False_Sharing"
    else
        SUITE_FAILED=$((SUITE_FAILED + 1))
        echo "[SUITE FAIL] False_Sharing"
    fi
else
    echo "[SUITE SKIP] False_Sharing: fa_test.json not found"
fi

# === Phoenix ===
run_suite "Phoenix" "$SCRIPT_DIR/phoenix/run_all_phoenix.sh" "$SCRIPT_DIR/phoenix"

# === Cache Effects ===
run_suite "Cache Effects" "$SCRIPT_DIR/cache-effects/run_all_cache_effects.sh" "$SCRIPT_DIR/cache-effects"

# === Spring 2020 Tutorial ===
run_suite "Spring 2020 Tutorial" "$SCRIPT_DIR/spring_2020_tutorial/run_all_spring_2020.sh" "$SCRIPT_DIR/spring_2020_tutorial"

echo ""
echo "########################################################################"
echo "#  ALL SUITES COMPLETE"
echo "#  Suites: $SUITE_TOTAL total, $SUITE_PASSED passed, $SUITE_FAILED failed"
echo "########################################################################"
