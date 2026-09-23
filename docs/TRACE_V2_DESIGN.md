# 插桩与 trace 协议

本文只描述当前实现。操作步骤见 [v2](TRACE_V2_USAGE.md) 和
[v3](LOGICAL_TRACE_USAGE.md)，参数见 [配置说明](CONFIGURATION.md)。

## 插桩范围与阶段

两个 Pass 均为 New PM Module Pass，由插件入口注册。`field-analysis` 也接入
默认优化管线结束扩展点；`logical-trace` 需显式调用，并在 LLVM 优化前观察前端 IR。
树内 CMake 直接构建同一份根目录源码，不维护另一套 Pass。

先收集原始指令再插入回调，避免遍历生成的回调。默认遍历全部可插桩函数，
函数筛选规则见 README。多源文件运行器先合并 IR；外部未提供的函数体无法追踪。

支持普通/volatile/atomic load/store、atomicrmw、cmpxchg、普通 memcpy/memmove/memset。
访问宽度来自 DataLayout 或 intrinsic 的动态长度。memcpy/memmove 各记录源与目的区间；
零长度不产生事件。GEP 本身不产生事件。固定向量记录整个区间。
非默认地址空间、非 64 位指针和 scalable/masked/gather/scatter 等操作受限，
静态报告记录可识别的 unsupported 项；普通外部调用不代表库内部覆盖。

普通访存在指令前回调，表示尝试访问；cmpxchg 在指令后根据成功位记为 RMW 或 R。
v2 通过指令 metadata 避免重复插桩，并为增量轮次分配不同模块身份；仅分析不改 IR。
v3 通过模块标记避免重复执行，应始终从原始 IR 重新配置采集，不能混用已插桩 v2 IR。
两者均清理定义和直接调用处过时的 memory、nofree、nosync、captures 等属性。

## 运行时与格式

运行时为每个线程分配独立 TLS buffer，满块同步刷盘。记录单调时钟
`CLOCK_MONOTONIC_RAW` 纳秒、`sched_getcpu()` 逻辑 CPU、OS TID、线程实例和线程序号。
线程正常退出释放 buffer 并写状态，进程退出写运行状态；没有信号刷盘保证。
线程应 join 后结束进程。异步信号处理内插桩、初始化后 fork 不支持。

| 内容 | 格式 |
| --- | --- |
| 文件头，32 B | magic[8]、version:u32、record_size:u32、pid:u64、run_id:u64 |
| v2 事件，80 B | timestamp/address/size/thread_instance/thread_seq/module_id/os_tid：7 个 u64；site_id/fid：2 个 u32；cpu_id:i32；mode/flags/reserved：3 个 u32 |
| v3 事件，96 B | v2 事件加 object_id:u64、object_offset:u64 |
| magic | `FATRCV2\0` 或 `FATRCV3\0` |
| mode | R=0、W=1、RMW=2 |
| flags | atomic=1、volatile=2、after=4、range=8、时间/CPU 观测错误=16 |

整数均为小端，无 C struct padding 依赖，reserved 必须为 0。
二进制与文本 CSV 同时输出；事件身份为 `(run_id,pid,thread_instance,thread_seq)`。
同线程 seq 定义观测顺序；跨线程时间排序只是分析顺序，不是硬件全局因果关系。
module_id/site_id 描述静态位置，不是对象身份；每个构建/运行应使用独立目录。

## 逻辑对象与分析

v3 显式选择全局、入口块栈对象或 heap allocator 调用点。运行时登记 base/extent，
每次登记生成新 object_id；free、munmap、realloc 更新生命周期。
同一地址复用不会合并对象。运行时对象查找使用互斥锁和线性表，开销随登记对象增长。
不支持部分 munmap、TLS 全局目标、异常展开栈生命周期或隐式自定义 allocator 生命周期。

离线通过 element_size、shape、strides 和 fields 恢复逻辑坐标。shape/strides
需要与实际布局一致；不是由虚拟地址自动发现高级语言对象。完整性认证拒绝跨元素 range，
partial 访问可导出，但图和投影只接受完整标量节点。

访问图在同 run/phase、固定半开时间窗口内对所有事件两两计数，self_pairs 单列。
a=同逻辑 CPU；m=同线程迁移；r=异 CPU/异线程且均为读；f=其余异 CPU/异线程对。
这些是访问关系分类，f 本身不等于已证实伪共享。实现每窗口为 O(n²)，大窗口不可直接
用于高流量 trace。布局投影只计算候选字节地址，不执行程序、不回放缓存、不产生 Hit/Miss。

## 完整性语义

`trace_io.check_complete` 要求非空、单 schema 记录、正常进程退出、全部线程结束，
线程身份/计数/连续 seq 对齐，无采样、时限、丢失、I/O 或时间/CPU 错误；
所有事件有静态报告，目录中静态报告无 unsupported 项。v3 还核对对象登记和事件计数、
对象内边界与逻辑坐标。空记录、崩溃、`_exit` 或缺失状态文件不能认证完整。

该认证不证明未插桩库、内联汇编、后端 spill、硬件预取和设备访问已被覆盖。
仅含声明且没有函数体的模块不会自动产生事件。旧 v1 记录缺少六字段信息，
读取时保留为空，不能伪造时间、访问大小或 CPU。
