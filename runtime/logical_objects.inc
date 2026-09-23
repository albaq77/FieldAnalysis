/* Hand-written object registry shared by the logical callback and lifecycle hooks. */
typedef struct fa_object {
    struct fa_object *next;
    uint64_t id, base, extent;
    char *descriptor;
    int active;
} fa_object;
static pthread_mutex_t fa_object_lock = PTHREAD_MUTEX_INITIALIZER;
static fa_object *fa_objects;
static uint64_t fa_next_object, fa_candidates, fa_filtered, fa_selected, fa_object_errors;
static FILE *fa_object_file;
static int fa_logical_used;

static void __fa_runtime_object_failure(const char *message) {
    ++fa_object_errors;
    fprintf(stderr, "FieldAnalysis logical: %s\n", message);
    abort();
}
static void __fa_runtime_object_open(void) {
    if (fa_object_file) return;
    char path[2304];
    snprintf(path, sizeof(path), "%s/objects.%ld.%" PRIu64 ".jsonl", fa_directory, (long)fa_pid, fa_run_id);
    fa_object_file = fopen(path, "w");
    if (!fa_object_file) __fa_runtime_object_failure("cannot open object log");
}
static void __fa_runtime_object_emit(const fa_object *o, const char *kind) {
    __fa_runtime_object_open();
    if (fprintf(fa_object_file,
                "{\"event\":\"%s\",\"object_id\":%" PRIu64 ",\"base\":\"0x%" PRIx64
                "\",\"extent\":%" PRIu64 ",\"descriptor\":%s}\n",
                kind,o->id,o->base,o->extent,o->descriptor) < 0 || fflush(fa_object_file))
        __fa_runtime_object_failure("object log write failed");
}
static fa_object *__fa_runtime_find_base(uint64_t base) {
    for (fa_object *o=fa_objects;o;o=o->next) if (o->active && o->base==base) return o;
    return NULL;
}
static void __fa_runtime_register_locked(void *ptr, uint64_t extent, const char *descriptor) {
    uint64_t base=(uint64_t)(uintptr_t)ptr;
    if (!ptr || base==UINT64_MAX || !extent) return;
    if (extent>UINT64_MAX-base) __fa_runtime_object_failure("object interval overflow");
    for (fa_object *o=fa_objects;o;o=o->next)
        if (o->active && base<o->base+o->extent && o->base<base+extent)
            __fa_runtime_object_failure("overlapping live object registrations");
    fa_object *o=calloc(1,sizeof(*o));
    if (!o || !(o->descriptor=strdup(descriptor))) __fa_runtime_object_failure("registry allocation failed");
    o->id=++fa_next_object; o->base=base; o->extent=extent; o->active=1;
    o->next=fa_objects; fa_objects=o;
    __fa_runtime_object_emit(o,"alloc");
}
void __fa_object_register(void *ptr,uint64_t extent,const char *descriptor) {
    pthread_once(&fa_once,__fa_runtime_initialize);
    if (getpid()!=fa_pid) __fa_runtime_object_failure("forked object registration unsupported");
    pthread_mutex_lock(&fa_object_lock);
    fa_logical_used=1;
    __fa_runtime_register_locked(ptr,extent,descriptor);
    pthread_mutex_unlock(&fa_object_lock);
}
void __fa_object_retire(void *ptr,uint64_t size) {
    if (!fa_initialized || !ptr) return;
    pthread_mutex_lock(&fa_object_lock);
    fa_object *o=__fa_runtime_find_base((uint64_t)(uintptr_t)ptr);
    if (o) {
        if (size && size<o->extent) __fa_runtime_object_failure("partial retirement unsupported");
        __fa_runtime_object_emit(o,"free"); o->active=0;
    }
    pthread_mutex_unlock(&fa_object_lock);
}
void __fa_object_munmap(void *ptr,uint64_t size,int result) {
    if (result || !fa_initialized || !size) return;
    uint64_t base=(uint64_t)(uintptr_t)ptr;
    if (size>UINT64_MAX-base) __fa_runtime_object_failure("munmap interval overflow");
    pthread_mutex_lock(&fa_object_lock);
    for (fa_object *o=fa_objects;o;o=o->next)
        if (o->active && base<o->base+o->extent && o->base<base+size) {
            if (base>o->base || base+size<o->base+o->extent)
                __fa_runtime_object_failure("partial munmap of target unsupported");
            __fa_runtime_object_emit(o,"free"); o->active=0;
        }
    pthread_mutex_unlock(&fa_object_lock);
}
void __fa_object_realloc(void *oldptr,void *newptr,uint64_t size) {
    if (!fa_initialized) return;
    pthread_mutex_lock(&fa_object_lock);
    fa_object *old=__fa_runtime_find_base((uint64_t)(uintptr_t)oldptr);
    if (old && (newptr || size==0)) {
        /* glibc realloc(p,0) retires p; failure with nonzero size keeps it live. */
        __fa_runtime_object_emit(old,"free"); old->active=0;
        if (newptr && size) __fa_runtime_register_locked(newptr,size,old->descriptor);
    }
    pthread_mutex_unlock(&fa_object_lock);
}
static int __fa_runtime_object_lookup(const void *ptr,uint64_t size,uint64_t *id,uint64_t *offset) {
    uint64_t address=(uint64_t)(uintptr_t)ptr;
    if (size>UINT64_MAX-address) __fa_runtime_object_failure("access interval overflow");
    pthread_mutex_lock(&fa_object_lock);
    fa_logical_used=1; ++fa_candidates;
    for (fa_object *o=fa_objects;o;o=o->next) if (o->active) {
        if (address>=o->base && address-o->base<o->extent) {
            if (size>o->extent-(address-o->base)) __fa_runtime_object_failure("access crosses target boundary");
            *id=o->id; *offset=address-o->base; ++fa_selected;
            pthread_mutex_unlock(&fa_object_lock); return 1;
        }
        if (address<o->base && address+size>o->base) __fa_runtime_object_failure("access partially overlaps target");
    }
    ++fa_filtered;
    pthread_mutex_unlock(&fa_object_lock); return 0;
}
static void __fa_runtime_logical_finish(void) {
    pthread_mutex_lock(&fa_object_lock);
    if (fa_logical_used) {
        if (fa_object_file && fclose(fa_object_file)) __fa_runtime_object_failure("object log close failed");
        fa_object_file=NULL;
        char path[2304];
        snprintf(path,sizeof(path),"%s/logical_status.%ld.%" PRIu64 ".json",fa_directory,(long)fa_pid,fa_run_id);
        FILE *fp=fopen(path,"w");
        if (!fp) __fa_runtime_object_failure("cannot write logical status");
        int bad=fprintf(fp,"{\"schema_version\":3,\"candidates\":%" PRIu64
            ",\"filtered\":%" PRIu64 ",\"selected\":%" PRIu64
            ",\"objects\":%" PRIu64 ",\"object_errors\":%" PRIu64 "}\n",
            fa_candidates,fa_filtered,fa_selected,fa_next_object,fa_object_errors)<0;
        if (fclose(fp) || bad) __fa_runtime_object_failure("logical status write failed");
    }
    pthread_mutex_unlock(&fa_object_lock);
}
