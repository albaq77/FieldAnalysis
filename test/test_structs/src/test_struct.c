#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Foo {
    int a;
    float b;
    double c;
    char d[16];
    long e;
};

struct Bar {
    int x;
    int y;
    int z;
};

struct Inner {
    float p;
    double q;
};

struct Outer {
    int tag;
    struct Inner inner;
    long extra;
};

struct WithArray {
    int id;
    float scores[4];
    double total;
};

struct Foo g_foo;
struct Outer g_outer;
struct WithArray g_witharr;
struct Foo g_arr[5];

void init_global() {
    g_foo.a = 1;
    g_foo.b = 2.0f;
    g_foo.c = 3.0;
    strcpy(g_foo.d, "hello");
    g_foo.e = 42;
}

void access_global_ab() {
    int sum = 0;
    for (int i = 0; i < 100; i++) {
        g_foo.a += i;
        g_foo.b += (float)i * 0.5f;
        sum += g_foo.a;
    }
    printf("ab: %d %f\n", g_foo.a, g_foo.b);
}

void access_global_cd() {
    for (int i = 0; i < 50; i++) {
        g_foo.c += (double)i * 1.5;
        g_foo.d[i % 16] = 'a' + (i % 26);
    }
    printf("cd: %f %s\n", g_foo.c, g_foo.d);
}

void access_global_ae() {
    for (int i = 0; i < 200; i++) {
        g_foo.a += i;
        g_foo.e += (long)i * 3;
    }
    printf("ae: %d %ld\n", g_foo.a, g_foo.e);
}

void hot_alternate_fields() {
    for (int i = 0; i < 500; i++) {
        g_foo.a += 1;
        g_foo.b += 1.0f;
        g_foo.a -= 1;
        g_foo.b -= 1.0f;
    }
    printf("hot: %d %f\n", g_foo.a, g_foo.b);
}

void stack_struct() {
    struct Foo local;
    local.a = 10;
    local.b = 20.0f;
    local.c = 30.0;
    strcpy(local.d, "local");
    local.e = 99;
    printf("stack: %d %f %f %s %ld\n", local.a, local.b, local.c, local.d, local.e);
}

void heap_struct() {
    struct Foo *hp = (struct Foo *)malloc(sizeof(struct Foo));
    if (!hp) return;
    hp->a = 100;
    hp->b = 200.0f;
    hp->c = 300.0;
    strcpy(hp->d, "heap");
    hp->e = 999;
    printf("heap: %d %f %f %s %ld\n", hp->a, hp->b, hp->c, hp->d, hp->e);
    free(hp);
}

void bar_access() {
    struct Bar bar;
    bar.x = 1;
    bar.y = 2;
    bar.z = 3;
    printf("bar: %d %d %d\n", bar.x, bar.y, bar.z);
}

void nested_struct_access() {
    g_outer.tag = 1;
    g_outer.inner.p = 3.14f;
    g_outer.inner.q = 2.718;
    g_outer.extra = 100;
    for (int i = 0; i < 80; i++) {
        g_outer.inner.p += (float)i * 0.1f;
        g_outer.inner.q += (double)i * 0.01;
    }
    printf("nested: %d %f %f %ld\n", g_outer.tag, g_outer.inner.p, g_outer.inner.q, g_outer.extra);
}

void array_field_access() {
    g_witharr.id = 42;
    for (int i = 0; i < 4; i++) {
        g_witharr.scores[i] = (float)i * 10.0f;
    }
    g_witharr.total = 0.0;
    for (int i = 0; i < 4; i++) {
        g_witharr.total += g_witharr.scores[i];
    }
    printf("array_field: %d %f %f\n", g_witharr.id, g_witharr.scores[0], g_witharr.total);
}

void struct_array_access() {
    for (int i = 0; i < 5; i++) {
        g_arr[i].a = i * 10;
        g_arr[i].b = (float)i * 1.5f;
        g_arr[i].e = (long)i * 100;
    }
    for (int i = 0; i < 5; i++) {
        printf("arr[%d]: %d %f %ld\n", i, g_arr[i].a, g_arr[i].b, g_arr[i].e);
    }
}

void heap_nested_struct() {
    struct Outer *op = (struct Outer *)malloc(sizeof(struct Outer));
    if (!op) return;
    op->tag = 2;
    op->inner.p = 1.0f;
    op->inner.q = 2.0;
    op->extra = 50;
    printf("heap_nested: %d %f %f %ld\n", op->tag, op->inner.p, op->inner.q, op->extra);
    free(op);
}

void heap_struct_array() {
    struct Foo *arr = (struct Foo *)malloc(5 * sizeof(struct Foo));
    if (!arr) return;
    for (int i = 0; i < 5; i++) {
        arr[i].a = i;
        arr[i].e = (long)i * 7;
    }
    for (int i = 0; i < 5; i++) {
        printf("harr[%d]: %d %ld\n", i, arr[i].a, arr[i].e);
    }
    free(arr);
}

int main() {
    init_global();
    access_global_ab();
    access_global_cd();
    access_global_ae();
    hot_alternate_fields();
    stack_struct();
    heap_struct();
    bar_access();
    nested_struct_access();
    array_field_access();
    struct_array_access();
    heap_nested_struct();
    heap_struct_array();
    return 0;
}
