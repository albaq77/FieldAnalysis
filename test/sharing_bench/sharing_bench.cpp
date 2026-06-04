#include <iostream>
#include <thread>
#include <vector>
#include "./sharing.h"

const size_t ITERATIONS = 500000000;

// 1. 大型伪共享结构体 (跨越多个 Cacheline)
struct alignas(64) LargeFalseSharing {
    volatile long t1_data[15]; // 0 ~ 119 字节
    volatile long t2_data[15]; // 120 ~ 239 字节
};

// 2. 真共享结构体
struct alignas(64) TrueSharing {
    volatile long shared_val;
};

// 3. 无共享结构体
struct alignas(64) NoSharing {
    alignas(64) volatile long a;
    alignas(64) volatile long b;
};

// ======== 全局实例 (BSS段) ========
LargeFalseSharing global_lfs;
TrueSharing global_ts;

// ======== 工作函数 (支持指针传入，实现复用) ========
void work_lfs_1(LargeFalseSharing* ptr) { 
	for (size_t i = 0; i < ITERATIONS; ++i) 
		AAA;
}
void work_lfs_2(LargeFalseSharing* ptr) {
	for (size_t i = 0; i < ITERATIONS; ++i) 
		ptr->t2_data[0]++; 
}

void work_ts(TrueSharing* ptr) {
	for (size_t i = 0; i < ITERATIONS; ++i)
		ptr->shared_val++;
}

int main() {
    std::cout << "🔥 开启全并发压力测试 (Global, Stack, Heap 同时轰炸)..." << std::endl;
    
    // ======== 栈实例 (Stack) ========
    // 只要 main 函数不退，这些栈变量的生命周期就一直存在，传指针给子线程是安全的
    LargeFalseSharing stack_lfs;
    TrueSharing stack_ts;

    // ======== 堆实例 (Heap) ========
    LargeFalseSharing* heap_lfs = new LargeFalseSharing();
    TrueSharing* heap_ts = new TrueSharing();

    std::vector<std::thread> threads;

    // 1. 注入 [全局区] 噪音
    threads.emplace_back(work_lfs_1, &global_lfs);
    threads.emplace_back(work_lfs_2, &global_lfs);
    threads.emplace_back(work_ts, &global_ts);
    threads.emplace_back(work_ts, &global_ts);

    // 2. 注入 [栈区] 噪音
    threads.emplace_back(work_lfs_1, &stack_lfs);
    threads.emplace_back(work_lfs_2, &stack_lfs);
    threads.emplace_back(work_ts, &stack_ts);
    threads.emplace_back(work_ts, &stack_ts);

    // 3. 注入 [堆区] 噪音
    threads.emplace_back(work_lfs_1, heap_lfs);
    threads.emplace_back(work_lfs_2, heap_lfs);
    threads.emplace_back(work_ts, heap_ts);
    threads.emplace_back(work_ts, heap_ts);

    for (auto& t : threads) {
        t.join();
    }
    
    delete heap_lfs;
    delete heap_ts;
    std::cout << "✅ 测试完成." << std::endl;
    return 0;
}
/*

g++ -g -O0 -pthread sharing_bench.cpp -o sharing_bench -static

sudo /home/neu/exp/perfparse/target/debug/perfparse      ./sharing_bench
sudo /home/neu/exp/perfparse_a/target/debug/perfparse_a  ./sharing_bench
*/
