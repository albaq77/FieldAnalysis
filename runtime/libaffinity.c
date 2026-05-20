#include "libaffinity.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

#ifdef FIELDANALYSIS_MULTITHREAD
#include <pthread.h>
#include <stdatomic.h>

static _Atomic uint64_t sample_counter = 0;
static pthread_mutex_t trace_mutex = PTHREAD_MUTEX_INITIALIZER;
static volatile sig_atomic_t sig_terminate = 0;

#define SAMPLE_COUNTER_INC() atomic_fetch_add(&sample_counter, 1)
#define TRACE_LOCK()         pthread_mutex_lock(&trace_mutex)
#define TRACE_UNLOCK()       pthread_mutex_unlock(&trace_mutex)
#define TRACE_TRYLOCK()      pthread_mutex_trylock(&trace_mutex)
#else
static uint64_t sample_counter = 0;

#define SAMPLE_COUNTER_INC() (sample_counter++)
#define TRACE_LOCK()         ((void)0)
#define TRACE_UNLOCK()       ((void)0)
#define TRACE_TRYLOCK()      (0)
#endif

static uint64_t sample_rate = 1;
static uint64_t trace_threshold;
static int chunk_index = 0;

struct trace_record {
    uint64_t ts;
    uint32_t fid;
    uint64_t addr;
    int is_write;
    char region;
};

static uint32_t window[AFFINITY_WINDOW_SIZE];
static uint64_t win_pos = 0;
static int win_fill = 0;
static uint64_t affinity[AFFINITY_MAX_FIELDS][AFFINITY_MAX_FIELDS];

static struct trace_record *trace_buffer = NULL;
static uint64_t trace_count = 0;

static uintptr_t heap_top = 0;

__attribute__((constructor))
static void __detect_heap_bounds(void) {
    heap_top = (uintptr_t)sbrk(0);
}

static char classify_region(void *addr) {
    extern char __data_start;
    extern char _end;
    uintptr_t ua = (uintptr_t)addr;
    uintptr_t data_start = (uintptr_t)&__data_start;
    uintptr_t data_end = (uintptr_t)&_end;
    if (ua >= data_start && ua < data_end) return 'G';
    if (ua > data_end && ua < heap_top + (1ULL << 40)) return 'H';
    return 'S';
}

static void __flush_trace_chunk(void) {
    char fname[64];

    sprintf(fname, "trace.%d.bin", chunk_index);
    FILE *fp = fopen(fname, "wb");
    if (fp) {
        for (uint64_t i = 0; i < trace_count; i++) {
            fwrite(&trace_buffer[i], sizeof(struct trace_record), 1, fp);
        }
        fclose(fp);
    }

    sprintf(fname, "access_trace.%d.txt", chunk_index);
    fp = fopen(fname, "w");
    if (fp) {
        for (uint64_t i = 0; i < trace_count; i++) {
            char rw = trace_buffer[i].is_write == 1 ? 'W' :
                      trace_buffer[i].is_write == 2 ? 'M' : 'R';
            fprintf(fp, "[%llu] %u %c 0x%llx %c\n",
                    (unsigned long long)trace_buffer[i].ts,
                    trace_buffer[i].fid,
                    rw,
                    (unsigned long long)trace_buffer[i].addr,
                    trace_buffer[i].region);
        }
        fclose(fp);
    }

    trace_count = 0;
    chunk_index++;
}

static void __dump_affinity_to_file(FILE *fp) {
    for (int i = 0; i < AFFINITY_MAX_FIELDS; i++) {
        for (int j = i; j < AFFINITY_MAX_FIELDS; j++) {
            if (affinity[i][j] == 0) continue;
            uint32_t a = (uint32_t)i;
            uint32_t b = (uint32_t)j;
            uint32_t count = (uint32_t)affinity[i][j];
            fwrite(&a, sizeof(uint32_t), 1, fp);
            fwrite(&b, sizeof(uint32_t), 1, fp);
            fwrite(&count, sizeof(uint32_t), 1, fp);
        }
    }
}

static void signal_handler(int sig) {
    (void)sig;
    if (TRACE_TRYLOCK() == 0) {
        if (trace_count > 0) {
            __flush_trace_chunk();
        }
        FILE *fp = fopen("affinity.bin", "wb");
        if (fp) {
            __dump_affinity_to_file(fp);
            fclose(fp);
        }
        _exit(0);
    }
#ifdef FIELDANALYSIS_MULTITHREAD
    sig_terminate = 1;
#endif
}

__attribute__((constructor))
static void __init_runtime(void) {
    struct sigaction sa;
    sa.sa_handler = signal_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    sigaction(SIGINT, &sa, NULL);
    sigaction(SIGTERM, &sa, NULL);

    char *rt = getenv("TRACE_RUNTIME_SECONDS");
    if (rt) {
        int sec = atoi(rt);
        if (sec > 0) {
            sigaction(SIGALRM, &sa, NULL);
            alarm(sec);
        }
    }

    char *sr = getenv("TRACE_SAMPLE_RATE");
    if (sr) {
        uint64_t rate = (uint64_t)atoll(sr);
        if (rate > 0) {
            sample_rate = rate;
        }
    }
}

__attribute__((destructor(101)))
static void __dump_affinity(void) {
    TRACE_LOCK();
    FILE *fp = fopen("affinity.bin", "wb");
    if (fp) {
        __dump_affinity_to_file(fp);
        fclose(fp);
    }
    TRACE_UNLOCK();
}

__attribute__((visibility("default")))
void __record_field_access(uint32_t fid) {
    uint64_t n = SAMPLE_COUNTER_INC();
    if (n % sample_rate != 0) return;

    TRACE_LOCK();
    int fill = win_fill < AFFINITY_WINDOW_SIZE ? win_fill : AFFINITY_WINDOW_SIZE;
    for (int i = 1; i <= fill; i++) {
        uint32_t other = window[(win_pos - i) & (AFFINITY_WINDOW_SIZE - 1)];
        uint32_t a = fid < other ? fid : other;
        uint32_t b = fid < other ? other : fid;
        if (a < AFFINITY_MAX_FIELDS && b < AFFINITY_MAX_FIELDS) {
            affinity[a][b]++;
        }
    }
    window[win_pos & (AFFINITY_WINDOW_SIZE - 1)] = fid;
    win_pos++;
    if (win_fill < AFFINITY_WINDOW_SIZE) {
        win_fill++;
    }
#ifdef FIELDANALYSIS_MULTITHREAD
    if (sig_terminate) {
        TRACE_UNLOCK();
        _exit(0);
    }
#endif
    TRACE_UNLOCK();
}

__attribute__((visibility("default")))
void __record_field_access_full(uint32_t fid, void *ptr, int is_write) {
    uint64_t n = SAMPLE_COUNTER_INC();
    if (n % sample_rate != 0) return;

    TRACE_LOCK();
    int fill = win_fill < AFFINITY_WINDOW_SIZE ? win_fill : AFFINITY_WINDOW_SIZE;
    for (int i = 1; i <= fill; i++) {
        uint32_t other = window[(win_pos - i) & (AFFINITY_WINDOW_SIZE - 1)];
        uint32_t a = fid < other ? fid : other;
        uint32_t b = fid < other ? other : fid;
        if (a < AFFINITY_MAX_FIELDS && b < AFFINITY_MAX_FIELDS) {
            affinity[a][b]++;
        }
    }
    window[win_pos & (AFFINITY_WINDOW_SIZE - 1)] = fid;
    win_pos++;
    if (win_fill < AFFINITY_WINDOW_SIZE) {
        win_fill++;
    }

    if (trace_buffer == NULL) {
        char *env = getenv("TRACE_FLUSH_THRESHOLD");
        trace_threshold = env ? (uint64_t)atoll(env) : TRACE_FLUSH_THRESHOLD;
        if (trace_threshold == 0) trace_threshold = TRACE_FLUSH_THRESHOLD;
        trace_buffer = (struct trace_record *)malloc(trace_threshold * sizeof(struct trace_record));
        if (!trace_buffer) {
            TRACE_UNLOCK();
            return;
        }
    }

    trace_buffer[trace_count].ts = win_pos;
    trace_buffer[trace_count].fid = fid;
    trace_buffer[trace_count].addr = (uint64_t)(uintptr_t)ptr;
    trace_buffer[trace_count].is_write = is_write;
    trace_buffer[trace_count].region = classify_region(ptr);
    trace_count++;

    if (trace_count >= trace_threshold) {
        __flush_trace_chunk();
    }
#ifdef FIELDANALYSIS_MULTITHREAD
    if (sig_terminate) {
        TRACE_UNLOCK();
        _exit(0);
    }
#endif
    TRACE_UNLOCK();
}

__attribute__((destructor(100)))
static void __dump_trace(void) {
    TRACE_LOCK();
    if (trace_count > 0) {
        __flush_trace_chunk();
    }
    free(trace_buffer);
    TRACE_UNLOCK();
}