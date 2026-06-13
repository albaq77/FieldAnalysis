#!/bin/bash
set -euo pipefail

# ============================================================
# BlackScholes FieldAnalysis Test Script
# ============================================================
# Analyzes struct field affinity in the PARSEC Blackscholes
# benchmark using the FieldAnalysis LLVM Pass.
#
# Key struct: OptionData_ { s, strike, r, divq, v, t,
#                            OptionType, divs, DGrefval }
#
# Usage:
#   bash run_blackscholes.sh
#
# Environment variables:
#   CLANG              - Path to clang (default: clang)
#   OPT                - Path to opt (default: opt)
#   LLVM_LINK          - Path to llvm-link (default: llvm-link)
#   BUILD_MODE         - 'plugin' or 'in-tree' (default: plugin)
#   FA_BUILD_DIR       - FieldAnalysis plugin build directory
#   BS_MODE            - 'serial' | 'pthreads' | 'simd' | 'lto' (default: serial)
#   NTHREADS           - Number of threads for pthreads mode (default: 1)
#   OPT_LEVEL          - Optimization level (default: O0)
#   MULTITHREAD        - Enable multi-thread runtime (0 or 1, default: 0)
#   SIMPLE_ACCESS      - Use simple access record mode (0 or 1, default: 0)
#   TRACE_RUNTIME_SECONDS  - Runtime seconds for tracing (default: unset)
#   TRACE_FLUSH_THRESHOLD  - Trace flush threshold (default: unset)
#   TRACE_SAMPLE_RATE      - Trace sample rate (default: unset)
#   NUM_RUNS           - Number of computation iterations (default: 10)
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BLACKSCHOLES_DIR="$(dirname "$SCRIPT_DIR")"
SRC_DIR="${BLACKSCHOLES_DIR}/src"
FA_DIR="$(cd "$(dirname "$BLACKSCHOLES_DIR")/.." && pwd)"

CLANG="${CLANG:-clang}"
OPT="${OPT:-opt}"
LLVM_LINK="${LLVM_LINK:-llvm-link}"
BUILD_MODE="${BUILD_MODE:-plugin}"
LLVM_DIR="${LLVM_DIR:-}"
MULTITHREAD="${MULTITHREAD:-0}"
BS_MODE="${BS_MODE:-serial}"
NTHREADS="${NTHREADS:-1}"
OPT_LEVEL="${OPT_LEVEL:-O2}"
NUM_RUNS="${NUM_RUNS:-10}"
INPUT_FILE="${INPUT_FILE:-${SRC_DIR}/in_64K.txt}"
OUTPUT_FILE="${OUTPUT_FILE:-${SCRIPT_DIR}/prices_output.txt}"

RUNTIME_SRC_DIR="${FA_DIR}/runtime"
TOOLS_DIR="${FA_DIR}/tools"

echo "============================================================"
echo " BlackScholes FieldAnalysis Test"
echo "============================================================"
echo "  FA Dir:     $FA_DIR"
echo "  Src Dir:    $SRC_DIR"
echo "  Work Dir:   $SCRIPT_DIR"
echo "  Mode:       $BS_MODE"
echo "  Build:      $BUILD_MODE"
echo "  Opt Level:  -$OPT_LEVEL"
echo "  Num Runs:   $NUM_RUNS"
echo "  Input:      $INPUT_FILE"
echo "============================================================"

# ----------------------------------------------------------
# Step 0: Build runtime library
# ----------------------------------------------------------
echo ""
echo "=== Step 0: Build runtime library ==="
RUNTIME_CFLAGS=""
RUNTIME_LDFLAGS=""
if [ "$MULTITHREAD" = "1" ]; then
    RUNTIME_CFLAGS="-DFIELDANALYSIS_MULTITHREAD"
    RUNTIME_LDFLAGS="-lpthread"
    echo "  [multi-thread runtime enabled]"
fi
(cd "${RUNTIME_SRC_DIR}" && \
 "${RUNTIME_CC:-cc}" -c libaffinity.c -o libaffinity.o ${RUNTIME_CFLAGS} && \
 ar rcs libaffinity.a libaffinity.o)
RUNTIME_LIB="${RUNTIME_SRC_DIR}/libaffinity.a"
echo "  Runtime lib: $RUNTIME_LIB"

cd "$SCRIPT_DIR"

PASS_EXTRA_FLAGS=""
if [ "${SIMPLE_ACCESS:-0}" = "1" ]; then
    PASS_EXTRA_FLAGS="--simple-access-record"
    echo "  [simple access record mode: field_id only, no address]"
fi

# ----------------------------------------------------------
# Determine source file and compile flags based on BS_MODE
# ----------------------------------------------------------
case "$BS_MODE" in
    serial)
        BS_SRC="${SRC_DIR}/blackscholes.c"
        BS_CFLAGS="-DNUM_RUNS=${NUM_RUNS}"
        BS_LDFLAGS="-lm"
        ;;
    pthreads)
        if [ ! -f "${SRC_DIR}/blackscholes.m4.cpp" ]; then
            echo "  Generating blackscholes.m4.cpp via M4..."
            m4 "${SRC_DIR}/c.m4.pthreads" "${SRC_DIR}/blackscholes.c" \
                > "${SRC_DIR}/blackscholes.m4.cpp"
        fi
        BS_SRC="${SRC_DIR}/blackscholes.m4.cpp"
        BS_CFLAGS="-DENABLE_THREADS -DNCO=4 -DNUM_RUNS=${NUM_RUNS}"
        BS_LDFLAGS="-lm -lpthread"
        MULTITHREAD=1
        RUNTIME_CFLAGS="-DFIELDANALYSIS_MULTITHREAD"
        RUNTIME_LDFLAGS="-lpthread"
        echo "  [pthreads mode: rebuilding runtime with FIELDANALYSIS_MULTITHREAD]"
        (cd "${RUNTIME_SRC_DIR}" && \
         "${RUNTIME_CC:-cc}" -c libaffinity.c -o libaffinity.o ${RUNTIME_CFLAGS} && \
         ar rcs libaffinity.a libaffinity.o)
        RUNTIME_LIB="${RUNTIME_SRC_DIR}/libaffinity.a"
        ;;
    simd)
        BS_SRC="${SRC_DIR}/blackscholes.simd.c"
        BS_CFLAGS="-msse3 -DNCO=4 -DNUM_RUNS=${NUM_RUNS}"
        BS_LDFLAGS="-lm"
        ;;
    lto)
        BS_CFLAGS="-DNUM_RUNS=${NUM_RUNS}"
        BS_LDFLAGS="-lm"
        if [ "$MULTITHREAD" = "1" ]; then
            BS_CFLAGS="${BS_CFLAGS} -DENABLE_THREADS -DNCO=4"
            BS_LDFLAGS="${BS_LDFLAGS} -lpthread"
        fi
        ;;
    *)
        echo "Error: unknown BS_MODE=$BS_MODE" >&2
        echo "  Use: serial | pthreads | simd | lto" >&2
        exit 1
        ;;
esac

echo "  Source:     ${BS_SRC:-LTO multi-file}"
echo "  CFLAGS:    $BS_CFLAGS"
echo "  LDFLAGS:   $BS_LDFLAGS"

# ----------------------------------------------------------
# LTO Multi-File Workflow
# ----------------------------------------------------------
if [ "$BS_MODE" = "lto" ]; then
    echo ""
    echo "=== LTO Multi-File Workflow ==="

    OBJ_DIR="${SCRIPT_DIR}/obj"
    mkdir -p "$OBJ_DIR"

    if [ "$MULTITHREAD" = "1" ]; then
        LTO_SOURCES=("${SRC_DIR}/blackscholes.m4.cpp")
        LTO_NAMES=("blackscholes")
    else
        LTO_SOURCES=("${SRC_DIR}/blackscholes.c")
        LTO_NAMES=("blackscholes")
    fi

    echo "--- Step L1: Compile each source to LTO bitcode ---"
    for i in "${!LTO_SOURCES[@]}"; do
        src="${LTO_SOURCES[$i]}"
        name="${LTO_NAMES[$i]}"
        obj="${OBJ_DIR}/${name}.o"
        echo "  $src -> $obj"
        "$CLANG" -g -${OPT_LEVEL} -flto=thin -c ${BS_CFLAGS} "$src" -o "$obj"
    done

    echo "--- Step L2: Merge bitcode with llvm-link ---"
    OBJ_FILES=()
    for name in "${LTO_NAMES[@]}"; do
        OBJ_FILES+=("${OBJ_DIR}/${name}.o")
    done
    "$LLVM_LINK" "${OBJ_FILES[@]}" -S -o blackscholes_combined.ll
    echo "  Combined IR: blackscholes_combined.ll"

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
            echo "--- Step L2.5: Build FieldAnalysis plugin ---"
            cmake -G Ninja -S "$FA_DIR" -B "$FA_BUILD_DIR" -DLLVM_DIR="$LLVM_DIR"
            cmake --build "$FA_BUILD_DIR"
        fi

        echo "--- Step L3: Run pass via opt with plugin ---"
        "$OPT" -load-pass-plugin="$PLUGIN_PATH" \
            -passes=field-analysis ${PASS_EXTRA_FLAGS} \
            -S blackscholes_combined.ll -o blackscholes_instrumented.ll

    else
        echo "--- Step L3: Run field-analysis pass (in-tree) ---"
        "$OPT" -passes=field-analysis --field-analysis-only \
            -S blackscholes_combined.ll -o blackscholes_analyzed.ll
        echo "  Analysis-only output: blackscholes_analyzed.ll"

        "$OPT" -passes=field-analysis ${PASS_EXTRA_FLAGS} \
            -S blackscholes_combined.ll -o blackscholes_instrumented.ll
    fi

    echo "--- Step L4: Compile instrumented IR + link runtime ---"
    "$CLANG" blackscholes_instrumented.ll -o blackscholes \
        "$RUNTIME_LIB" ${BS_LDFLAGS} ${RUNTIME_LDFLAGS}
    echo "  Executable: blackscholes"

# ----------------------------------------------------------
# Single-File Workflow (serial / pthreads / simd)
# ----------------------------------------------------------
else
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
            echo ""
            echo "=== Step 0.5: Build FieldAnalysis plugin ==="
            echo "  LLVM_DIR=$LLVM_DIR"
            echo "  Build dir=$FA_BUILD_DIR"
            CMAKE_GENERATOR="${CMAKE_GENERATOR:-Ninja}"
            cmake -G "$CMAKE_GENERATOR" -S "$FA_DIR" -B "$FA_BUILD_DIR" \
                -DLLVM_DIR="$LLVM_DIR"
            cmake --build "$FA_BUILD_DIR"
        fi

        echo ""
        echo "=== Step 1: Compile + instrument with plugin ==="
        if [ -n "$PASS_EXTRA_FLAGS" ]; then
            "$CLANG" -g -${OPT_LEVEL} -fpass-plugin="$PLUGIN_PATH" \
                -mllvm ${PASS_EXTRA_FLAGS} \
                ${BS_CFLAGS} \
                -o blackscholes "$BS_SRC" "$RUNTIME_LIB" \
                ${BS_LDFLAGS} ${RUNTIME_LDFLAGS}
        else
            "$CLANG" -g -${OPT_LEVEL} -fpass-plugin="$PLUGIN_PATH" \
                ${BS_CFLAGS} \
                -o blackscholes "$BS_SRC" "$RUNTIME_LIB" \
                ${BS_LDFLAGS} ${RUNTIME_LDFLAGS}
        fi
        echo "  Executable: blackscholes"

        echo ""
        echo "=== Step 1.5: Emit instrumented LLVM IR ==="
        if [ -n "$PASS_EXTRA_FLAGS" ]; then
            "$CLANG" -g -${OPT_LEVEL} -fpass-plugin="$PLUGIN_PATH" \
                -mllvm ${PASS_EXTRA_FLAGS} \
                -S -emit-llvm ${BS_CFLAGS} "$BS_SRC" \
                -o blackscholes_instrumented.ll
        else
            "$CLANG" -g -${OPT_LEVEL} -fpass-plugin="$PLUGIN_PATH" \
                -S -emit-llvm ${BS_CFLAGS} "$BS_SRC" \
                -o blackscholes_instrumented.ll
        fi
        echo "  Instrumented IR: blackscholes_instrumented.ll"

    elif [ "$BUILD_MODE" = "in-tree" ]; then
        echo ""
        echo "=== Step 1: Generate LLVM IR ==="
        "$CLANG" -g -${OPT_LEVEL} -S -emit-llvm ${BS_CFLAGS} "$BS_SRC" \
            -o blackscholes.ll
        echo "  IR: blackscholes.ll"

        echo ""
        echo "=== Step 2: Run field-analysis pass (analysis only) ==="
        "$OPT" -passes=field-analysis --field-analysis-only \
            -S blackscholes.ll -o blackscholes_analyzed.ll
        echo "  Output: blackscholes_analyzed.ll"
        echo "  Generated: gep_field_map.json, struct_layout.json"

        echo ""
        echo "=== Step 3: Run field-analysis pass (analysis + instrumentation) ==="
        "$OPT" -passes=field-analysis ${PASS_EXTRA_FLAGS} \
            -S blackscholes.ll -o blackscholes_instrumented.ll
        echo "  Output: blackscholes_instrumented.ll"

        echo ""
        echo "=== Step 4: Compile instrumented IR ==="
        "$CLANG" blackscholes_instrumented.ll -o blackscholes \
            "$RUNTIME_LIB" ${BS_LDFLAGS} ${RUNTIME_LDFLAGS}
        echo "  Executable: blackscholes"

    else
        echo "Error: unknown BUILD_MODE=$BUILD_MODE (use 'plugin' or 'in-tree')" >&2
        exit 1
    fi
fi

# ----------------------------------------------------------
# Step 5: Run the instrumented program
# ----------------------------------------------------------
echo ""
echo "=== Step 5: Run instrumented blackscholes ==="

TRACE_CMD=""
if [ -n "${TRACE_RUNTIME_SECONDS:-}" ]; then
    TRACE_CMD="${TRACE_CMD} TRACE_RUNTIME_SECONDS=${TRACE_RUNTIME_SECONDS}"
fi
if [ -n "${TRACE_FLUSH_THRESHOLD:-}" ]; then
    TRACE_CMD="${TRACE_CMD} TRACE_FLUSH_THRESHOLD=${TRACE_FLUSH_THRESHOLD}"
fi
if [ -n "${TRACE_SAMPLE_RATE:-}" ]; then
    TRACE_CMD="${TRACE_CMD} TRACE_SAMPLE_RATE=${TRACE_SAMPLE_RATE}"
fi

echo "  Command: ${TRACE_CMD} ./blackscholes ${NTHREADS} ${INPUT_FILE} ${OUTPUT_FILE}"
eval ${TRACE_CMD} ./blackscholes ${NTHREADS} "${INPUT_FILE}" "${OUTPUT_FILE}" || {
    echo "Warning: blackscholes exited with non-zero status (may be expected with instrumentation)"
}

# ----------------------------------------------------------
# Step 6: Run affinity analysis
# ----------------------------------------------------------
echo ""
echo "=== Step 6: Run affinity analysis (analyze.py) ==="
if [ -f gep_field_map.json ]; then
    python3 "${TOOLS_DIR}/analyze.py"
    echo "  Generated: reorder.json"
else
    echo "  Warning: gep_field_map.json not found, skipping analysis"
fi

# ----------------------------------------------------------
# Step 7: Build data flow graph
# ----------------------------------------------------------
echo ""
echo "=== Step 7: Build data flow graph (build_dfg.py) ==="
if [ -f gep_field_map.json ]; then
    python3 "${TOOLS_DIR}/build_dfg.py" "$SCRIPT_DIR"
    echo "  Generated: dfg_global.dot, dfg_heap.dot, dfg_stack.dot, dfg_unified.dot"
else
    echo "  Warning: gep_field_map.json not found, skipping DFG"
fi

# ----------------------------------------------------------
# Step 8: Render DFG to PNG (optional)
# ----------------------------------------------------------
echo ""
echo "=== Step 8: Render DFG (optional) ==="
if command -v dot &>/dev/null; then
    for dotfile in dfg_*.dot; do
        if [ -f "$dotfile" ]; then
            pngfile="${dotfile%.dot}.png"
            dot -Tpng "$dotfile" -o "$pngfile"
            echo "  Rendered: $pngfile"
        fi
    done
else
    echo "  Graphviz not installed, skipping PNG rendering"
    echo "  Install with: sudo apt install graphviz"
fi

# ----------------------------------------------------------
# Step 9: Display results
# ----------------------------------------------------------
echo ""
echo "============================================================"
echo " Results Summary"
echo "============================================================"

if [ -f gep_field_map.json ]; then
    echo ""
    echo "--- gep_field_map.json ---"
    cat gep_field_map.json
fi

if [ -f struct_layout.json ]; then
    echo ""
    echo "--- struct_layout.json ---"
    cat struct_layout.json
fi

if [ -f reorder.json ]; then
    echo ""
    echo "--- reorder.json ---"
    cat reorder.json
fi

if [ -f access_trace.0.txt ]; then
    echo ""
    echo "--- access_trace.0.txt (first 20 lines) ---"
    head -20 access_trace.0.txt
fi

echo ""
echo "--- Trace files ---"
ls -la trace.*.bin access_trace.*.txt 2>/dev/null || echo "  No trace files found"

echo ""
echo "--- DFG outputs ---"
ls -la dfg_*.dot dfg_*.png 2>/dev/null || echo "  No DFG outputs found"

echo ""
echo "--- All output files ---"
ls -la *.json *.ll *.dot *.png *.bin *.txt 2>/dev/null || echo "  No output files"

echo ""
echo "============================================================"
echo " BlackScholes FieldAnalysis Test Complete"
echo " Output directory: $SCRIPT_DIR"
echo "============================================================"
