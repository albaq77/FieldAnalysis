#include <iostream>
#include <thread>
#include <vector>
#include <atomic>
#include <chrono>
#include <cstring>
#include <cstdlib>

const size_t ITERATIONS = 50000000;

#define ALIGN_PAD 256
#define CACHELINE 64

// ==================== 场景 1：经典 False Sharing ====================
// 多个字段在同一缓存行内，不同线程访问不同字段

struct alignas(64) ClassicFalseSharing {
    volatile int field1;      // 偏移 0
    volatile int field2;      // 偏移 4
    volatile int field3;      // 偏移 8
    volatile int field4;      // 偏移 12
    volatile int field5;      // 偏移 16
    volatile int field6;      // 偏移 20
    volatile int field7;      // 偏移 24
    volatile int field8;      // 偏移 28
    volatile int field9;      // 偕移 32
    volatile int field10;     // 偏移 36
    volatile int field11;     // 偏移 40
    volatile int field12;     // 偏移 44
    volatile int field13;     // 偏移 48
    volatile int field14;     // 偏移 52
    volatile int field15;     // 偏移 56
    volatile int field16;     // 偏移 60
};

// ==================== 场景 2：部分 False Sharing ====================
// 部分字段在同一缓存行，部分字段独占缓存行

struct alignas(128) PartialFalseSharing {
    volatile long shared_group1[8];  // 0-63 字节（缓存行1）
    alignas(64) volatile long isolated1;  // 64 字节（缓存行2，独占）
    volatile long shared_group2[8];  // 72-135 字节（缓存行3）
    alignas(64) volatile long isolated2;  // 136 字节（缓存行4，独占）
};

// ==================== 场景 3：数组型 False Sharing ====================
// 数组元素在同一缓存行内

struct alignas(64) ArrayFalseSharing {
    volatile int data[16];  // 16个int，共64字节，正好一个缓存行
};

// ==================== 场景 4：嵌套结构体 False Sharing ====================
// 嵌套结构体的字段在同一缓存行

struct InnerStruct {
    volatile int inner_field1;
    volatile int inner_field2;
    volatile int inner_field3;
    volatile int inner_field4;
};

struct alignas(64) NestedFalseSharing {
    InnerStruct inner1;      // 0-15 字节
    InnerStruct inner2;      // 16-31 字节
    volatile int outer_field1;  // 32 字节
    volatile int outer_field2;  // 36 字节
};

// ==================== 场景 5：优化后的结构体 ====================
// 每个字段独占缓存行（无 False Sharing）

struct alignas(64) OptimizedStruct {
    alignas(64) volatile int optimized_field1;
    alignas(64) volatile int optimized_field2;
    alignas(64) volatile int optimized_field3;
    alignas(64) volatile int optimized_field4;
};

// ==================== 场景 6：混合类型结构体 ====================
// 不同类型的字段在同一缓存行

struct alignas(64) MixedTypeFalseSharing {
    volatile char char_field;      // 1 字节
    volatile short short_field;    // 2 字节
    volatile int int_field;        // 4 字节
    volatile long long_field;      // 8 字节
    volatile float float_field;    // 4 字节
    volatile double double_field;  // 8 字节
    volatile int padding[10];      // 填充到64字节
};

// ==================== 场景 7：动态分配数组 ====================
// 动态分配的数组元素在同一缓存行

struct DynamicArrayStruct {
    volatile int* dynamic_data;
    size_t size;
};

// ==================== 工作函数 ====================

// 场景 1：经典 False Sharing - 每个字段独立函数以支持 addr2line 解析
#define WORK_CLASSIC_FIELD(n) \
void work_classic_fs_field##n(ClassicFalseSharing* ptr) { \
    for (size_t i = 0; i < ITERATIONS; ++i) { \
        ptr->field##n++; \
    } \
}

WORK_CLASSIC_FIELD(1)  WORK_CLASSIC_FIELD(2)  WORK_CLASSIC_FIELD(3)  WORK_CLASSIC_FIELD(4)
WORK_CLASSIC_FIELD(5)  WORK_CLASSIC_FIELD(6)  WORK_CLASSIC_FIELD(7)  WORK_CLASSIC_FIELD(8)
WORK_CLASSIC_FIELD(9)  WORK_CLASSIC_FIELD(10) WORK_CLASSIC_FIELD(11) WORK_CLASSIC_FIELD(12)
WORK_CLASSIC_FIELD(13) WORK_CLASSIC_FIELD(14) WORK_CLASSIC_FIELD(15) WORK_CLASSIC_FIELD(16)

// 场景 2：部分 False Sharing
void work_partial_fs_group1(PartialFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->shared_group1[0]++;
    }
}

void work_partial_fs_group2(PartialFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->shared_group2[0]++;
    }
}

void work_partial_fs_isolated1(PartialFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->isolated1++;
    }
}

void work_partial_fs_isolated2(PartialFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->isolated2++;
    }
}

// 场景 3：数组型 False Sharing - 每个索引独立函数
#define WORK_ARRAY_FS_INDEX(idx) \
void work_array_fs_idx##idx(ArrayFalseSharing* ptr) { \
    for (size_t i = 0; i < ITERATIONS; ++i) { \
        ptr->data[idx]++; \
    } \
}

WORK_ARRAY_FS_INDEX(0)
WORK_ARRAY_FS_INDEX(4)
WORK_ARRAY_FS_INDEX(8)
WORK_ARRAY_FS_INDEX(12)

// 场景 4：嵌套结构体 False Sharing
void work_nested_inner1(NestedFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->inner1.inner_field1++;
    }
}

void work_nested_inner2(NestedFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->inner2.inner_field1++;
    }
}

void work_nested_outer(NestedFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->outer_field1++;
    }
}

// 场景 5：优化后的结构体（无 False Sharing）
#define WORK_OPTIMIZED_FIELD(n) \
void work_optimized_field##n(OptimizedStruct* ptr) { \
    for (size_t i = 0; i < ITERATIONS; ++i) { \
        ptr->optimized_field##n++; \
    } \
}

WORK_OPTIMIZED_FIELD(1) WORK_OPTIMIZED_FIELD(2) WORK_OPTIMIZED_FIELD(3) WORK_OPTIMIZED_FIELD(4)

// 场景 6：混合类型结构体
void work_mixed_char(MixedTypeFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->char_field++;
    }
}

void work_mixed_int(MixedTypeFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->int_field++;
    }
}

void work_mixed_long(MixedTypeFalseSharing* ptr) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->long_field++;
    }
}

// 场景 7：动态数组
void work_dynamic_array(DynamicArrayStruct* ptr, int index) {
    for (size_t i = 0; i < ITERATIONS; ++i) {
        ptr->dynamic_data[index]++;
    }
}

// ==================== 主程序 ====================

int main() {
    std::cout << "🔥 启动复杂 False Sharing 测试..." << std::endl;
    std::cout << "包含 7 种不同场景，每种场景测试不同的 False Sharing 模式" << std::endl;
    std::cout << "迭代次数: " << ITERATIONS << std::endl;
    std::cout << std::endl;

    std::cout << "所有 malloc 已完成，等待 memscope 和 perf 准备好..." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(5));
    std::cout << "开始运行测试..." << std::endl;
    std::cout << std::endl;
    
    std::vector<std::thread> threads;
    
    std::cout << "分配堆内存（使用 malloc）..." << std::endl;

    // ==================== 场景 1：经典 False Sharing ====================
    std::cout << "场景 1: 经典 False Sharing (16个字段在同一缓存行)" << std::endl;
    ClassicFalseSharing* classic_fs_heap;
    void* classic_fs_heap_buf = malloc(sizeof(ClassicFalseSharing) * 1 + ALIGN_PAD);
    classic_fs_heap = (ClassicFalseSharing*)(((unsigned long long)classic_fs_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(classic_fs_heap, 0, sizeof(ClassicFalseSharing) * 1);

    typedef void (*ClassicWorkFunc)(ClassicFalseSharing*);
    ClassicWorkFunc classic_funcs[] = {
        nullptr,
        work_classic_fs_field1, work_classic_fs_field2, work_classic_fs_field3, work_classic_fs_field4,
        work_classic_fs_field5, work_classic_fs_field6, work_classic_fs_field7, work_classic_fs_field8,
    };
    for (int i = 1; i <= 8; ++i) {
        threads.emplace_back(classic_funcs[i], classic_fs_heap);
    }
    
    // ==================== 场景 2：部分 False Sharing ====================
    std::cout << "场景 2: 部分 False Sharing (部分字段共享，部分独占)" << std::endl;
    PartialFalseSharing* partial_fs_heap;
    void* partial_fs_heap_buf = malloc(sizeof(PartialFalseSharing) * 1 + ALIGN_PAD);
    partial_fs_heap = (PartialFalseSharing*)(((unsigned long long)partial_fs_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(partial_fs_heap, 0, sizeof(PartialFalseSharing) * 1);

    threads.emplace_back(work_partial_fs_group1, partial_fs_heap);
    threads.emplace_back(work_partial_fs_group2, partial_fs_heap);
    threads.emplace_back(work_partial_fs_isolated1, partial_fs_heap);
    threads.emplace_back(work_partial_fs_isolated2, partial_fs_heap);
    
    // ==================== 场景 3：数组型 False Sharing ====================
    std::cout << "场景 3: 数组型 False Sharing (数组元素在同一缓存行)" << std::endl;
    ArrayFalseSharing* array_fs_heap;
    void* array_fs_heap_buf = malloc(sizeof(ArrayFalseSharing) * 1 + ALIGN_PAD);
    array_fs_heap = (ArrayFalseSharing*)(((unsigned long long)array_fs_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(array_fs_heap, 0, sizeof(ArrayFalseSharing) * 1);

    threads.emplace_back(work_array_fs_idx0, array_fs_heap);
    threads.emplace_back(work_array_fs_idx4, array_fs_heap);
    threads.emplace_back(work_array_fs_idx8, array_fs_heap);
    threads.emplace_back(work_array_fs_idx12, array_fs_heap);
    
    // ==================== 场景 4：嵌套结构体 False Sharing ====================
    std::cout << "场景 4: 嵌套结构体 False Sharing" << std::endl;
    NestedFalseSharing* nested_fs_heap;
    void* nested_fs_heap_buf = malloc(sizeof(NestedFalseSharing) * 1 + ALIGN_PAD);
    nested_fs_heap = (NestedFalseSharing*)(((unsigned long long)nested_fs_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(nested_fs_heap, 0, sizeof(NestedFalseSharing) * 1);

    threads.emplace_back(work_nested_inner1, nested_fs_heap);
    threads.emplace_back(work_nested_inner2, nested_fs_heap);
    threads.emplace_back(work_nested_outer, nested_fs_heap);
    
    // ==================== 场景 5：优化后的结构体（无 False Sharing）====================
    std::cout << "场景 5: 优化后的结构体 (每个字段独占缓存行，无 False Sharing)" << std::endl;
    OptimizedStruct* optimized_heap;
    void* optimized_heap_buf = malloc(sizeof(OptimizedStruct) * 1 + ALIGN_PAD);
    optimized_heap = (OptimizedStruct*)(((unsigned long long)optimized_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(optimized_heap, 0, sizeof(OptimizedStruct) * 1);

    typedef void (*OptimizedWorkFunc)(OptimizedStruct*);
    OptimizedWorkFunc optimized_funcs[] = {
        nullptr,
        work_optimized_field1, work_optimized_field2, work_optimized_field3, work_optimized_field4,
    };
    for (int i = 1; i <= 4; ++i) {
        threads.emplace_back(optimized_funcs[i], optimized_heap);
    }
    
    // ==================== 场景 6：混合类型结构体 ====================
    std::cout << "场景 6: 混合类型结构体 False Sharing" << std::endl;
    MixedTypeFalseSharing* mixed_fs_heap;
    void* mixed_fs_heap_buf = malloc(sizeof(MixedTypeFalseSharing) * 1 + ALIGN_PAD);
    mixed_fs_heap = (MixedTypeFalseSharing*)(((unsigned long long)mixed_fs_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(mixed_fs_heap, 0, sizeof(MixedTypeFalseSharing) * 1);

    threads.emplace_back(work_mixed_char, mixed_fs_heap);
    threads.emplace_back(work_mixed_int, mixed_fs_heap);
    threads.emplace_back(work_mixed_long, mixed_fs_heap);
    
    // ==================== 场景 7：动态数组 ====================
    std::cout << "场景 7: 动态数组 False Sharing" << std::endl;
    DynamicArrayStruct* dynamic_heap;
    void* dynamic_heap_buf = malloc(sizeof(DynamicArrayStruct) * 1 + ALIGN_PAD);
    dynamic_heap = (DynamicArrayStruct*)(((unsigned long long)dynamic_heap_buf + ALIGN_PAD) & ~(CACHELINE - 1));
    memset(dynamic_heap, 0, sizeof(DynamicArrayStruct) * 1);
    dynamic_heap->dynamic_data = (volatile int*)malloc(16 * sizeof(volatile int));
    memset((void*)dynamic_heap->dynamic_data, 0, 16 * sizeof(volatile int));
    dynamic_heap->size = 16;

    threads.emplace_back(work_dynamic_array, dynamic_heap, 0);
    threads.emplace_back(work_dynamic_array, dynamic_heap, 4);
    threads.emplace_back(work_dynamic_array, dynamic_heap, 8);
    threads.emplace_back(work_dynamic_array, dynamic_heap, 12);
    
    // ==================== 等待所有线程完成 ====================
    std::cout << std::endl;
    std::cout << "等待所有线程完成..." << std::endl;
    std::cout << "总线程数: " << threads.size() << std::endl;
    
    for (auto& t : threads) {
        t.join();
    }

    std::cout << std::endl;
    std::cout << "所有线程已完成，等待退出前保持 2 秒确保 perf 采集完..." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(2));
    
    // ==================== 清理资源 ====================
    free(classic_fs_heap_buf);
    free(partial_fs_heap_buf);
    free(array_fs_heap_buf);
    free(nested_fs_heap_buf);
    free(optimized_heap_buf);
    free(mixed_fs_heap_buf);
    free((void*)dynamic_heap->dynamic_data);
    free(dynamic_heap_buf);
    
    std::cout << std::endl;
    std::cout << "✅ 测试完成！" << std::endl;
    std::cout << std::endl;
    std::cout << "预期结果：" << std::endl;
    std::cout << "- 场景 1-4, 6-7: 应检测到大量 False Sharing" << std::endl;
    std::cout << "- 场景 5: 应检测到很少或无 False Sharing" << std::endl;
    
    return 0;
}

/*
编译命令：
g++ -g -O0 -pthread complex_fs_bench.cpp -o complex_fs_bench_dynamic

运行分析：
python3 false_sharing_analyzer_v2.py ./complex_fs_bench

预期检测到的字段：
1. ClassicFalseSharing.field1-16 (严重 False Sharing)
2. PartialFalseSharing.shared_group1, shared_group2 (False Sharing)
3. PartialFalseSharing.isolated1, isolated2 (无 False Sharing)
4. ArrayFalseSharing.data (数组元素 False Sharing)
5. NestedFalseSharing.inner1, inner2, outer_field1 (False Sharing)
6. OptimizedStruct.optimized_field1-4 (无 False Sharing)
7. MixedTypeFalseSharing.char_field, int_field, long_field (False Sharing)
8. DynamicArrayStruct.dynamic_data (动态数组 False Sharing)
*/