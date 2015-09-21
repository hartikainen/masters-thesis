#define BLOCK_SIZE 128
#define L2_SIZE 4194304
#define L2_BLOCKS (L2_SIZE / BLOCK_SIZE)

#define L2_CYCLES_PER_INT 2.4
#define L2_CYCLES_PER_BLOCK (L2_CYCLES_PER_INT * (BLOCK_SIZE / sizeof(int))) // 61.44

#define RAM_CYCLES_PER_INT 12.0
#define RAM_CYCLES_PER_BLOCK (RAM_CYCLES_PER_INT * (BLOCK_SIZE / sizeof(int))) // 384

double get_mem_delay(double, double);
