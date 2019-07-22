# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "main.h" 1


void update();
void draw();
void init();


typedef struct {
 int row, oldRow;
 int col, oldCol;
 int rowDel;
 int colDel;
 int height;
 int width;
 int collisionCheck;
 volatile const unsigned short* image;
} BIRDSTRUCT;


typedef struct {
 int row, oldRow;
 int col, oldCol;
 int height;
 int width;

 int active;

 unsigned char color;
} PILLAR;
# 2 "update.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 32 "myLib.h"
extern unsigned short *videoBuffer;



void setPixel(int row, int col, unsigned short color);
void setPixel4(int row, int col, unsigned char color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds3(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short color);
void fillScreen4(unsigned char color);
void drawBackgroundImage3(const unsigned short*);
void drawBackgroundImage4(volatile const unsigned short*);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void loadPalette(volatile const unsigned short* palette);

void flipPage();

int rand();
void srand();
# 70 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 80 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 3 "update.c" 2
# 1 "update.h" 1



void updatePlayer(BIRDSTRUCT* b);
void updateDrop(BIRDSTRUCT* b);
void updatePillar(PILLAR *p);
# 4 "update.c" 2
# 27 "update.c"
void updatePlayer(BIRDSTRUCT* p) {

 p->oldRow = p->row;
 p->oldCol = p->col;

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<6)))) {
  if(p -> row > 0) {
   p->row--;
  }
 }
}

void updateDrop(BIRDSTRUCT* p) {
 if (p -> row < 160 - p -> height) {
  p->oldRow = p->row;
  p->row = p-> row + 6;
 }
}

void updatePillar(PILLAR *p) {
 p -> oldCol = p -> col;
 if(p -> active) {
  p -> col = p -> col - 2;
  if(p -> col <= 0) {
   p -> row = -(p -> col);
   p -> active = !(p -> active);
  }
 }
}
# 69 "update.c"
int collisionCheckObstacleTarget(BIRDSTRUCT* b, PILLAR* p)
{
 if (p -> active == 1) {
  if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row && b->row <= p ->row + p-> height) {
   b->rowDel = -b->rowDel;
   b -> colDel = -b->colDel;
   p -> active = 1;
   return 1;
  }
 }
 return 0;
}
