struct Pair { int a, b; };
volatile struct Pair pair;
int main(void) {
    int a = pair.b;
    pair.b = a + 1;
    int b = pair.b;
    (void)b;
    return 0;
}
