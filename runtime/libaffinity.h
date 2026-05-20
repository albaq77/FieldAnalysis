#ifndef LIBAFFINITY_H
#define LIBAFFINITY_H

#include <stdint.h>

#define AFFINITY_WINDOW_SIZE 16
#define AFFINITY_MAX_FIELDS 2048
#define TRACE_FLUSH_THRESHOLD 1000000
#define TRACE_SAMPLE_RATE 1

void __record_field_access(uint32_t fid);

__attribute__((visibility("default")))
void __record_field_access_full(uint32_t fid, void *ptr, int is_write);

#endif
