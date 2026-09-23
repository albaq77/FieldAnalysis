extern void update(void);
extern volatile int shared;
int main(void) {
    update();
    return shared == 17 ? 0 : 1;
}
