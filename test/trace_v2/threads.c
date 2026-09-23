#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>

extern void trace_worker(void *);
struct item { int fields[2]; int cpu; };
static void *worker(void *arg) {
    struct item *item = arg;
    cpu_set_t mask;
    CPU_ZERO(&mask); CPU_SET(item->cpu, &mask);
    if (pthread_setaffinity_np(pthread_self(), sizeof(mask), &mask)) abort();
    trace_worker(item->fields);
    return NULL;
}
int main(void) {
    cpu_set_t available;
    if (sched_getaffinity(0, sizeof(available), &available)) return 2;
    struct item items[2] = {0}; int n = 0;
    for (int cpu = 0; cpu < CPU_SETSIZE && n < 2; ++cpu)
        if (CPU_ISSET(cpu, &available)) items[n++].cpu = cpu;
    if (!n) return 3;
    if (n == 1) items[1].cpu = items[0].cpu;
    pthread_t threads[2];
    for (int i = 0; i < 2; ++i)
        if (pthread_create(&threads[i], NULL, worker, &items[i])) return 4;
    for (int i = 0; i < 2; ++i) pthread_join(threads[i], NULL);
    printf("bound_cpus=%d,%d\n", items[0].cpu, items[1].cpu);
    return 0;
}
