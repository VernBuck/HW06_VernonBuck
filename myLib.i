# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2

unsigned short * videoBuffer = (unsigned short *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;

void setPixel(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void setPixel4(int row, int col, unsigned char colorIndex) {



 unsigned short pixel = videoBuffer[((row)*(240)+(col))/2];
 if(col & 1) {
  pixel &= 0xFF;
  videoBuffer[((row)*(240)+(col))/2] = pixel | (colorIndex << 8);
 } else {
  pixel &= ~0xFF;
  videoBuffer[((row)*(240)+(col))/2] = pixel | colorIndex;
 }
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = (1 << 31) | control;
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{




 unsigned short pixels = colorIndex << 8 | colorIndex;
 for(int r = 0; r < height; r++) {
  if(col & 1) {
   setPixel4(row + r, col, colorIndex);
   if(width & 1) {
    DMANow(3, &pixels, &videoBuffer[((row+r)*(240)+(col+1))/2], width/2 | (2 << 23));
   } else {
    DMANow(3, &pixels, &videoBuffer[((row+r)*(240)+(col+1))/2], (width/2 - 1) | (2 << 23));
    setPixel4(row + r, col + width - 1, colorIndex);
   }
  } else {
   if (width & 1) {
    DMANow(3, &pixels, &videoBuffer[((row+r)*(240)+(col))/2], width/2 | (2 << 23));
    setPixel4(row + r, col + width - 1, colorIndex);
   } else {
    DMANow(3, &pixels, &videoBuffer[((row+r)*(240)+(col))/2], width/2 | (2 << 23));
   }
  }
 }

}

void drawRectInBounds3(int row, int col, int height, int width, unsigned short color)
{
 if(col < 0)
 {
  width += col;
  col = 0;
 }
 if(col+width > 240)
 {
  width -= ((col+width)-240);
  col = 240;
 }
    drawRect3(row,col,height,width,color);
}

void drawBackgroundImage3(const unsigned short * image)
{
 DMANow(3, (unsigned short*)image, videoBuffer, (240*160));
}

void drawBackgroundImage4(volatile const unsigned short* image) {



 DMANow(3, (unsigned short*)image, videoBuffer, (240*160)/2);
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, (unsigned short*)&image[((i)*(width)+(0))], &videoBuffer[((row+i)*(240)+(col))], (width));
 }
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width) {



 int i;
 if ((col & 1)) {
  col++;
 }
 for(i = 0; i < height; i++)
 {
  DMANow(3, (unsigned short*)&image[((i)*(width)+(0))/2], &videoBuffer[((row+i)*(240)+(col))/2], (width)/2);
 }
}

void loadPalette(volatile const unsigned short* palette)
{



    DMANow(3, palette, ((u16 *)0x5000000), 256);
}

void fillScreen(unsigned short color)
{
 volatile unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | 240 * 160);
}

void fillScreen4(unsigned char colorIndex)
{

 volatile unsigned short pixels = (colorIndex << 8) | (colorIndex);


 DMANow(3, &pixels, videoBuffer, (2 << 23) | (240 * 160)/2);
}

void flipPage()
{
    if(*(unsigned short *)0x4000000 & (1<<4))
    {
        *(unsigned short *)0x4000000 &= ~(1<<4);
        videoBuffer = backBuffer;
    }
    else
    {
        *(unsigned short *)0x4000000 |= (1<<4);
        videoBuffer = frontBuffer;
    }
}

void waitForVBlank()
{
 while(*(volatile u16 *)0x4000006>160);
 while(*(volatile u16 *)0x4000006<160);
}
