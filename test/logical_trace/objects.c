#define _GNU_SOURCE
#include <sys/mman.h>
#include <unistd.h>

volatile int grid[2][2];

int main(void) {
    size_t bytes = (size_t)sysconf(_SC_PAGESIZE);
    int *a = mmap(0, bytes, PROT_READ | PROT_WRITE,
                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (a == MAP_FAILED) return 2;
    grid[0][1] = 11;
    a[0] = 3;
    a[3] = 5;
    if (munmap(a, bytes)) return 3;
    int *b = mmap(a, bytes, PROT_READ | PROT_WRITE,
                  MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
    if (b != a) return 4;
    b[0] = 7;
    b[3] = 9;
    int ok = grid[0][1] == 11 && b[3] == 9;
    if (munmap(b, bytes)) return 5;
    return ok ? 0 : 6;
}
