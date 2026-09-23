#ifndef LIBAFFINITY_H
#define LIBAFFINITY_H
#include <stdint.h>
#define AFFINITY_WINDOW_SIZE 16
#define AFFINITY_MAX_FIELDS 2048
#ifdef __cplusplus
extern "C" {
#endif
/* mode: R=0 W=1 RMW=2; flags: atomic=1 volatile=2 after=4 range=8 error=16. */
void __fa_record_access_v2(uint64_t module_id, uint32_t site_id, uint32_t fid,
                          const void *address, uint64_t access_size,
                          uint32_t mode, uint32_t flags);
void __fa_object_register(void *ptr, uint64_t extent, const char *descriptor_json);
void __fa_object_retire(void *ptr, uint64_t size);
void __fa_object_munmap(void *ptr, uint64_t size, int result);
void __fa_object_realloc(void *oldptr, void *newptr, uint64_t size);
void __fa_record_logical(uint64_t module_id, uint32_t site_id, uint32_t fid,
                         const void *address, uint64_t size, uint32_t mode, uint32_t flags);
/* Compatibility: old ABI can only supply field affinity, not v2 trace. */
void __record_field_access(uint32_t fid);
void __record_field_access_full(uint32_t fid, void *ptr, int is_write);
#ifdef __cplusplus
}
#endif
#endif
