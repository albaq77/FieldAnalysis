#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include "libaffinity.h"
#include <errno.h>
#include <inttypes.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

enum { FA_RECORD_BYTES = 80, FA_HEADER_BYTES = 32 };
typedef struct fa_state {
    struct fa_state *next;
    uint64_t instance, tid, sequence, observed, emitted, sampled_out;
    uint64_t io_errors, lost, chunk, count, capacity;
    int finished, limited;
    uint32_t schema, record_bytes;
    unsigned char *buffer;
} fa_state;
static pthread_once_t fa_once = PTHREAD_ONCE_INIT;
static pthread_key_t fa_key;
static pthread_mutex_t fa_registry_lock = PTHREAD_MUTEX_INITIALIZER;
static fa_state *fa_states;
static uint64_t fa_next_thread, fa_run_id, fa_rate = 1, fa_capacity = 4096, fa_deadline;
static pid_t fa_pid;
static char fa_directory[2048] = ".";
static _Thread_local fa_state *fa_tls;
static _Thread_local int fa_in_callback;
static int fa_initialized;
static void __fa_runtime_logical_finish(void);

static void __fa_runtime_put32(unsigned char *p, uint32_t v) {
    for (unsigned i = 0; i < 4; ++i) p[i] = (unsigned char)(v >> (8 * i));
}
static void __fa_runtime_put64(unsigned char *p, uint64_t v) {
    for (unsigned i = 0; i < 8; ++i) p[i] = (unsigned char)(v >> (8 * i));
}
static uint32_t __fa_runtime_get32(const unsigned char *p) {
    uint32_t v = 0; for (unsigned i = 0; i < 4; ++i) v |= (uint32_t)p[i] << (8*i); return v;
}
static uint64_t __fa_runtime_get64(const unsigned char *p) {
    uint64_t v = 0; for (unsigned i = 0; i < 8; ++i) v |= (uint64_t)p[i] << (8*i); return v;
}
static uint64_t __fa_runtime_now(void) {
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC_RAW, &ts) != 0) return 0;
    return (uint64_t)ts.tv_sec * UINT64_C(1000000000) + (uint64_t)ts.tv_nsec;
}
static uint64_t __fa_runtime_env_positive(const char *name, uint64_t fallback) {
    const char *v = getenv(name); char *end = NULL;
    if (!v || !*v || *v == '-') return fallback;
    errno = 0; unsigned long long n = strtoull(v, &end, 10);
    return errno || *end || !n ? fallback : (uint64_t)n;
}
static void __fa_runtime_path(char *dst, size_t size, const char *prefix,
                    uint64_t instance, uint64_t chunk, const char *suffix) {
    int n = snprintf(dst, size, "%s/%s.%ld.%" PRIu64 ".%" PRIu64 ".%" PRIu64 ".%s",
                     fa_directory, prefix, (long)fa_pid, fa_run_id, instance, chunk, suffix);
    if (n < 0 || (size_t)n >= size) { fputs("FieldAnalysis: trace path too long\n", stderr); abort(); }
}
static void __fa_runtime_flush(fa_state *s) {
    if (!s->count) return;
    char path[2304];
    __fa_runtime_path(path, sizeof(path), "trace", s->instance, s->chunk, "bin");
    unsigned char header[FA_HEADER_BYTES] = { 'F','A','T','R','C','V','2',0 };
    header[6] = (unsigned char)('0'+s->schema);
    __fa_runtime_put32(header+8, s->schema); __fa_runtime_put32(header+12, s->record_bytes);
    __fa_runtime_put64(header+16, (uint64_t)fa_pid); __fa_runtime_put64(header+24, fa_run_id);
    FILE *fp = fopen(path, "wb"); int ok = 0;
    if (fp) {
        ok = fwrite(header, 1, sizeof(header), fp) == sizeof(header);
        if (fwrite(s->buffer, s->record_bytes, s->count, fp) != s->count) ok = 0;
        if (fclose(fp) != 0) ok = 0;
    }
    if (ok) s->emitted += s->count;
    else { ++s->io_errors; s->lost += s->count; fprintf(stderr, "FieldAnalysis: failed writing %s\n", path); }
    __fa_runtime_path(path, sizeof(path), "access_trace", s->instance, s->chunk, "txt");
    fp = fopen(path, "w"); ok = fp != NULL;
    if (fp) {
        if (fprintf(fp, "#FA_TRACE_V%u pid=%ld run_id=%" PRIu64 "\n"
                    "timestamp_ns,address,access_size,thread_instance,thread_seq,module_id,os_tid,site_id,fid,cpu_id,mode,flags%s\n",
                    s->schema, (long)fa_pid, fa_run_id,
                    s->schema == 3 ? ",object_id,object_offset" : "") < 0) ok=0;
        for (uint64_t i = 0; i < s->count; ++i) {
            const unsigned char *p = s->buffer + i * s->record_bytes;
            uint32_t mode = __fa_runtime_get32(p+68);
            if (fprintf(fp, "%" PRIu64 ",0x%" PRIx64 ",%" PRIu64 ",%" PRIu64
                        ",%" PRIu64 ",%" PRIu64 ",%" PRIu64 ",%u,%u,%d,%s,%u",
                        __fa_runtime_get64(p), __fa_runtime_get64(p+8), __fa_runtime_get64(p+16), __fa_runtime_get64(p+24),
                        __fa_runtime_get64(p+32), __fa_runtime_get64(p+40), __fa_runtime_get64(p+48),
                        __fa_runtime_get32(p+56), __fa_runtime_get32(p+60), (int32_t)__fa_runtime_get32(p+64),
                        mode == 0 ? "R" : mode == 1 ? "W" : "RMW", __fa_runtime_get32(p+72)) < 0) ok = 0;
            if (s->schema==3 && fprintf(fp, ",%" PRIu64 ",%" PRIu64,__fa_runtime_get64(p+80),__fa_runtime_get64(p+88))<0) ok=0;
            if (fputc('\n',fp)==EOF) ok=0;
        }
        if (fclose(fp) != 0) ok = 0;
    }
    if (!ok) { ++s->io_errors; fprintf(stderr, "FieldAnalysis: failed writing %s\n", path); }
    s->count = 0; ++s->chunk;
}
static void __fa_runtime_manifest(fa_state *s) {
    char path[2304]; __fa_runtime_path(path, sizeof(path), "trace_status", s->instance, 0, "json");
    FILE *fp = fopen(path, "w");
    if (!fp) { fprintf(stderr, "FieldAnalysis: cannot write status %s\n", path); return; }
    int n = fprintf(fp,
        "{\"schema_version\":%u,\"pid\":%ld,\"run_id\":\"%" PRIu64 "\","
        "\"thread_instance\":%" PRIu64 ",\"os_tid\":%" PRIu64 ","
        "\"observed\":%" PRIu64 ",\"emitted\":%" PRIu64 ",\"sampled_out\":%" PRIu64 ","
        "\"lost\":%" PRIu64 ",\"io_errors\":%" PRIu64 ",\"sample_rate\":%" PRIu64 ","
        "\"chunks\":%" PRIu64 ",\"capture_limited\":%s,\"finished\":true,"
        "\"complete\":%s,\"clock\":\"CLOCK_MONOTONIC_RAW\","
        "\"cpu_semantics\":\"logical_cpu_at_callback\"}\n",
        s->schema, (long)fa_pid, fa_run_id, s->instance, s->tid, s->observed, s->emitted,
        s->sampled_out, s->lost, s->io_errors, fa_rate, s->chunk,
        s->limited ? "true" : "false",
        !s->io_errors && !s->lost && !s->sampled_out && !s->limited ? "true" : "false");
    int c = fclose(fp);
    if (n < 0 || c) fprintf(stderr, "FieldAnalysis: status write failed %s\n", path);
}
static void __fa_runtime_finish_thread(void *ptr) {
    fa_state *s = ptr; if (!s || s->finished) return;
    fa_in_callback = 1; __fa_runtime_flush(s); __fa_runtime_manifest(s);
    free(s->buffer); s->buffer = NULL;
    pthread_mutex_lock(&fa_registry_lock); s->finished = 1; pthread_mutex_unlock(&fa_registry_lock);
    fa_tls = NULL; fa_in_callback = 0;
}
static int __fa_runtime_topology_value(long cpu, const char *key) {
    char path[160]; int value = -1;
    snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%ld/topology/%s", cpu, key);
    FILE *fp = fopen(path, "r");
    if (fp) { if (fscanf(fp, "%d", &value) != 1) value = -1; fclose(fp); }
    return value;
}
__attribute__((destructor(101))) static void __fa_runtime_process_finish(void) {
    if (!fa_initialized || getpid() != fa_pid) return;
    __fa_runtime_finish_thread(fa_tls);
    __fa_runtime_logical_finish();
    char path[2304]; __fa_runtime_path(path, sizeof(path), "trace_run", 0, 0, "json");
    pthread_mutex_lock(&fa_registry_lock);
    uint64_t active = 0, threads = 0;
    for (fa_state *s = fa_states; s; s = s->next) { ++threads; if (!s->finished) ++active; }
    pthread_mutex_unlock(&fa_registry_lock);
    FILE *fp = fopen(path, "w");
    if (fp) {
        int n = fprintf(fp, "{\"schema_version\":2,\"pid\":%ld,\"run_id\":\"%" PRIu64
                           "\",\"threads\":%" PRIu64 ",\"active_threads_at_exit\":%" PRIu64
                           ",\"normal_exit\":true,\"clock\":\"CLOCK_MONOTONIC_RAW\"}\n",
                           (long)fa_pid, fa_run_id, threads, active);
        int c = fclose(fp);
        if (n < 0 || c) fputs("FieldAnalysis: run status write failed\n", stderr);
    } else fputs("FieldAnalysis: cannot write run status\n", stderr);
}
static void __fa_runtime_initialize(void) {
    fa_pid = getpid(); fa_run_id = __fa_runtime_now();
    const char *dir = getenv("FA_TRACE_DIR");
    if (dir) { if (strlen(dir) >= sizeof(fa_directory)) abort(); strcpy(fa_directory, dir); }
    fa_rate = __fa_runtime_env_positive("TRACE_SAMPLE_RATE", 1);
    fa_capacity = __fa_runtime_env_positive("TRACE_FLUSH_THRESHOLD", 4096);
    if (fa_capacity > (UINT64_C(1) << 20)) fa_capacity = UINT64_C(1) << 20;
    uint64_t sec = __fa_runtime_env_positive("TRACE_RUNTIME_SECONDS", 0);
    if (sec && sec < (UINT64_MAX-fa_run_id)/UINT64_C(1000000000))
        fa_deadline = fa_run_id + sec*UINT64_C(1000000000);
    if (!fa_run_id || pthread_key_create(&fa_key, __fa_runtime_finish_thread) != 0) {
        fputs("FieldAnalysis: initialization failed\n", stderr); abort();
    }
    fa_initialized = 1;
    char path[2304]; __fa_runtime_path(path, sizeof(path), "cpu_topology", 0, 0, "csv");
    FILE *fp = fopen(path, "w");
    if (fp) {
        fprintf(fp, "cpu_id,package_id,die_id,core_id\n");
        long n = sysconf(_SC_NPROCESSORS_CONF);
        for (long cpu = 0; cpu < n; ++cpu)
            fprintf(fp, "%ld,%d,%d,%d\n", cpu, __fa_runtime_topology_value(cpu, "physical_package_id"),
                    __fa_runtime_topology_value(cpu, "die_id"), __fa_runtime_topology_value(cpu, "core_id"));
        fclose(fp);
    }
}
#include "logical_objects.inc"

static void __fa_runtime_record_impl(uint64_t module_id, uint32_t site_id, uint32_t fid,
                            const void *address, uint64_t size, uint32_t mode, uint32_t flags,
                            uint64_t object_id, uint64_t object_offset, uint32_t schema) {
    if (!size || fa_in_callback) return;
    fa_in_callback = 1; pthread_once(&fa_once, __fa_runtime_initialize);
    if (getpid() != fa_pid) { fputs("FieldAnalysis: fork after trace initialization unsupported\n", stderr); _exit(74); }
    fa_state *s = fa_tls;
    if (!s) {
        s = calloc(1, sizeof(*s)); if (!s) abort();
        s->capacity = fa_capacity; s->schema=schema; s->record_bytes=schema==3?96:80;
        s->buffer = malloc((size_t)s->capacity * s->record_bytes);
        if (!s->buffer) abort();
        s->tid = (uint64_t)syscall(SYS_gettid);
        pthread_mutex_lock(&fa_registry_lock);
        s->instance = ++fa_next_thread; s->next = fa_states; fa_states = s;
        pthread_mutex_unlock(&fa_registry_lock);
        if (pthread_setspecific(fa_key, s) != 0) abort();
        fa_tls = s;
    }
    if (s->schema!=schema) { fputs("FieldAnalysis: cannot mix raw and logical trace in one thread\n",stderr); abort(); }
    ++s->observed; ++s->sequence;
    uint64_t now = __fa_runtime_now();
    if (fa_deadline && now >= fa_deadline) { s->limited = 1; ++s->sampled_out; fa_in_callback = 0; return; }
    if ((s->sequence - 1) % fa_rate) { ++s->sampled_out; fa_in_callback = 0; return; }
    int cpu = sched_getcpu(); if (!now || cpu < 0) flags |= 16U;
    unsigned char *p = s->buffer + s->count * s->record_bytes;
    __fa_runtime_put64(p, now); __fa_runtime_put64(p+8, (uint64_t)(uintptr_t)address);
    __fa_runtime_put64(p+16, size); __fa_runtime_put64(p+24, s->instance); __fa_runtime_put64(p+32, s->sequence);
    __fa_runtime_put64(p+40, module_id); __fa_runtime_put64(p+48, s->tid);
    __fa_runtime_put32(p+56, site_id); __fa_runtime_put32(p+60, fid); __fa_runtime_put32(p+64, (uint32_t)cpu);
    __fa_runtime_put32(p+68, mode); __fa_runtime_put32(p+72, flags); __fa_runtime_put32(p+76, 0);
    if (schema==3) { __fa_runtime_put64(p+80,object_id); __fa_runtime_put64(p+88,object_offset); }
    ++s->count; if (s->count == s->capacity) __fa_runtime_flush(s);
    fa_in_callback = 0;
}

void __fa_record_access_v2(uint64_t m,uint32_t site,uint32_t fid,const void *p,uint64_t size,uint32_t mode,uint32_t flags) {
    __fa_runtime_record_impl(m,site,fid,p,size,mode,flags,0,0,2);
}
void __fa_record_logical(uint64_t m,uint32_t site,uint32_t fid,const void *p,uint64_t size,uint32_t mode,uint32_t flags) {
    if (!size || fa_in_callback) return;
    pthread_once(&fa_once,__fa_runtime_initialize);
    if (getpid()!=fa_pid) __fa_runtime_object_failure("forked tracing unsupported");
    uint64_t id=0,offset=0;
    if (__fa_runtime_object_lookup(p,size,&id,&offset)) __fa_runtime_record_impl(m,site,fid,p,size,mode,flags,id,offset,3);
}

// Legacy affinity-only ABI: never fabricate missing six-field information.
static pthread_mutex_t fa_affinity_lock = PTHREAD_MUTEX_INITIALIZER;
static uint32_t fa_window[AFFINITY_WINDOW_SIZE];
static uint64_t fa_position, fa_affinity[AFFINITY_MAX_FIELDS][AFFINITY_MAX_FIELDS];
static int fa_affinity_used;
void __record_field_access(uint32_t fid) {
    pthread_mutex_lock(&fa_affinity_lock); fa_affinity_used = 1;
    uint64_t fill = fa_position < AFFINITY_WINDOW_SIZE ? fa_position : AFFINITY_WINDOW_SIZE;
    for (uint64_t i = 1; i <= fill; ++i) {
        uint32_t other = fa_window[(fa_position-i) % AFFINITY_WINDOW_SIZE];
        uint32_t a = fid < other ? fid : other, b = fid < other ? other : fid;
        if (b < AFFINITY_MAX_FIELDS) ++fa_affinity[a][b];
    }
    fa_window[fa_position++ % AFFINITY_WINDOW_SIZE] = fid;
    pthread_mutex_unlock(&fa_affinity_lock);
}
void __record_field_access_full(uint32_t fid, void *ptr, int is_write) {
    (void)ptr; (void)is_write; __record_field_access(fid);
}
__attribute__((destructor)) static void __fa_runtime_dump_legacy(void) {
    if (!fa_affinity_used) return;
    FILE *fp = fopen("affinity.bin", "wb"); if (!fp) return;
    for (uint32_t a = 0; a < AFFINITY_MAX_FIELDS; ++a)
        for (uint32_t b = a; b < AFFINITY_MAX_FIELDS; ++b) {
            uint64_t n = fa_affinity[a][b]; if (!n) continue;
            if (n > UINT32_MAX) { fputs("FieldAnalysis: legacy counter overflow\n", stderr); n = UINT32_MAX; }
            unsigned char rec[12]; __fa_runtime_put32(rec,a); __fa_runtime_put32(rec+4,b); __fa_runtime_put32(rec+8,(uint32_t)n);
            if (fwrite(rec,1,12,fp) != 12) break;
        }
    fclose(fp);
}
