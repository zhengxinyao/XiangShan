#include "common.h"

#define RAMSIZE (128 * 1024 * 1024)

static uint64_t ram[RAMSIZE / sizeof(uint64_t)];
static long img_size = 0;
void* get_img_start() { return &ram[0]; }
long get_img_size() { return img_size; }
void* get_ram_start() { return &ram[0]; }
long get_ram_size() { return RAMSIZE; }

void init_branch_record(const char *branch) {
  assert(branch != NULL);

  // TODO: add record processing code, load branch record into arrays

  // FILE *fp = fopen(branch, "rb");
  // if (fp == NULL) {
  //   printf("Can not open '%s'\n", branch);
  //   assert(0);
  // }

  // printf("The image is %s\n", img);

  // fseek(fp, 0, SEEK_END);
  // img_size = ftell(fp);

  // fseek(fp, 0, SEEK_SET);
  // int ret = fread(ram, img_size, 1, fp);
  // assert(ret == 1);
  // fclose(fp);

  // //new add
  // addpageSv39();
  // //new end
}

// TODO: read branch record arrays using idx, and give pc for validation
extern "C" void branch_helper(
    uint64_t rIdx, uint64_t *rdata, uint64_t wIdx, uint64_t wdata, uint64_t wmask, uint8_t wen) {
  if (rIdx >= RAMSIZE / sizeof(uint64_t)) {
    printf("ERROR: ram idx = 0x%x out of bound!\n", rIdx);
    // TODO: don't allow out of bound when crossbar is ready
    //assert(rIdx < RAMSIZE / sizeof(uint64_t));
    *rdata = 0xabcd12345678dcbaUL;
    return;
  }
  *rdata = ram[rIdx];
  if (wen) {
    assert(wIdx < RAMSIZE / sizeof(uint64_t));
    ram[wIdx] = (ram[wIdx] & ~wmask) | (wdata & wmask);
  }
}
