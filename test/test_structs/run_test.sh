#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FA_DIR="$(dirname "$SCRIPT_DIR")"

CLANG="${CLANG:-clang}"
OPT="${OPT:-opt}"
BUILD_MODE="${BUILD_MODE:-plugin}"
LLVM_DIR="${LLVM_DIR:-}"

RUNTIME_SRC_DIR="${FA_DIR}/runtime"
MULTITHREAD="${MULTITHREAD:-0}"

echo "=== Step 0: Build runtime library ==="
RUNTIME_CFLAGS=""
RUNTIME_LDFLAGS=""
if [ "$MULTITHREAD" = "1" ]; then
    RUNTIME_CFLAGS="-DFIELDANALYSIS_MULTITHREAD"
    RUNTIME_LDFLAGS="-lpthread"
    echo "  [multi-thread mode enabled]"
fi
(cd "${RUNTIME_SRC_DIR}" && \
 "${RUNTIME_CC:-cc}" -c libaffinity.c -o libaffinity.o ${RUNTIME_CFLAGS} && \
 ar rcs libaffinity.a libaffinity.o)
RUNTIME_LIB="${RUNTIME_SRC_DIR}/libaffinity.a"

cd "$SCRIPT_DIR"

PASS_EXTRA_FLAGS=""
if [ "${SIMPLE_ACCESS:-0}" = "1" ]; then
    PASS_EXTRA_FLAGS="--simple-access-record"
    echo "  [simple access record mode: field_id only, no address]"
fi

if [ "$BUILD_MODE" = "plugin" ]; then
    FA_BUILD_DIR="${FA_BUILD_DIR:-${FA_DIR}/build}"
    PLUGIN_EXT="${PLUGIN_EXT:-.so}"
    PLUGIN_PATH="${FA_BUILD_DIR}/FieldAnalysis${PLUGIN_EXT}"

    if [ ! -f "$PLUGIN_PATH" ]; then
        if [ -z "$LLVM_DIR" ]; then
            CLANG_BIN="$(which "$CLANG" 2>/dev/null || echo "$CLANG")"
            CLANG_DIR="$(dirname "$CLANG_BIN")"
            LLVM_DIR="${CLANG_DIR}/../lib/cmake/llvm"
        fi
        echo "=== Step 0.5: Build FieldAnalysis plugin ==="
        echo "  LLVM_DIR=$LLVM_DIR"
        echo "  Build dir=$FA_BUILD_DIR"
        CMAKE_GENERATOR="${CMAKE_GENERATOR:-Ninja}"
        cmake -G "$CMAKE_GENERATOR" -S "$FA_DIR" -B "$FA_BUILD_DIR" -DLLVM_DIR="$LLVM_DIR"
        cmake --build "$FA_BUILD_DIR"
    fi

    echo "=== Step 1: Compile with plugin ==="
    if [ -n "$PASS_EXTRA_FLAGS" ]; then
        "$CLANG" -g -O2 -fpass-plugin="$PLUGIN_PATH" \
            -mllvm ${PASS_EXTRA_FLAGS} \
            -o test_struct test_struct.c "$RUNTIME_LIB" ${RUNTIME_LDFLAGS}
    else
        "$CLANG" -g -O2 -fpass-plugin="$PLUGIN_PATH" \
            -o test_struct test_struct.c "$RUNTIME_LIB" ${RUNTIME_LDFLAGS}
    fi

    echo "=== Step 1.5: Emit instrumented LLVM IR ==="
    if [ -n "$PASS_EXTRA_FLAGS" ]; then
        "$CLANG" -g -O2 -fpass-plugin="$PLUGIN_PATH" \
            -mllvm ${PASS_EXTRA_FLAGS} \
            -S -emit-llvm test_struct.c -o test_struct_instrumented.ll
    else
        "$CLANG" -g -O2 -fpass-plugin="$PLUGIN_PATH" \
            -S -emit-llvm test_struct.c -o test_struct_instrumented.ll
    fi
elif [ "$BUILD_MODE" = "in-tree" ]; then
    echo "=== Step 1: Generate LLVM IR ==="
    "$CLANG" -g -O2 -S -emit-llvm test_struct.c -o test_struct.ll

    echo "=== Step 2: Run field-analysis pass ==="
    "$OPT" -passes=field-analysis ${PASS_EXTRA_FLAGS} -S test_struct.ll \
        -o test_struct_instrumented.ll

    echo "=== Step 3: Compile instrumented IR ==="
    "$CLANG" test_struct_instrumented.ll -o test_struct "$RUNTIME_LIB" ${RUNTIME_LDFLAGS}
else
    echo "Error: unknown BUILD_MODE=$BUILD_MODE (use 'plugin' or 'in-tree')" >&2
    exit 1
fi

echo "=== Step 4: Run executable ==="
./test_struct

echo "=== Step 5: Run analysis ==="
python3 "${FA_DIR}/tools/analyze.py"

echo "=== Step 6: Run DFG ==="
python3 "${FA_DIR}/tools/build_dfg.py"

echo "=== Step 7: Display results ==="
if [ -f gep_field_map.json ]; then
    echo "--- gep_field_map.json ---"
    cat gep_field_map.json
else
    echo "Warning: gep_field_map.json not found"
fi

if [ -f struct_layout.json ]; then
    echo "--- struct_layout.json ---"
    cat struct_layout.json
else
    echo "Warning: struct_layout.json not found"
fi

if [ -f reorder.json ]; then
    echo "--- reorder.json ---"
    cat reorder.json
else
    echo "Warning: reorder.json not found"
fi

if [ -f access_trace.0.txt ]; then
    echo "--- access_trace.0.txt (first 20 lines) ---"
    head -20 access_trace.0.txt
else
    echo "Warning: access_trace.0.txt not found"
fi

if [ -f trace.0.bin ]; then
    echo "--- trace.0.bin detected ---"
    ls -la trace.*.bin access_trace.*.txt 2>/dev/null
fi

echo "--- DFG outputs ---"
ls -la dfg_*.dot 2>/dev/null || echo "Warning: no DFG outputs"

echo "=== Done ==="