# 1 "draw.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "draw.c"
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
# 2 "draw.c" 2
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
# 3 "draw.c" 2




void drawBird(BIRDSTRUCT* b) {
 drawRect4(b->oldRow -10, b->oldCol - 10, b->height + 20, b->width + 20, 0);
 drawImage4(b -> image, b -> row, b -> col, b -> width, b -> height);
}

void drawPillar(PILLAR *b) {

 if(b->active) {
  drawRect4(b->oldRow, b->oldCol, b->height, b->width+5, 0);
  drawRect4(b -> row, b -> col, b -> height, b -> width, b -> color);
 } else {
  drawRect4(b->oldRow, b->oldCol, b->height, b->width+5, 0);
 }
}
