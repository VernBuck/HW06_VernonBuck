#include "myLib.h"

unsigned short * videoBuffer = (unsigned short *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

void setPixel(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row,col,240)] = color;
}

void setPixel4(int row, int col, unsigned char colorIndex) {
	//TODO: finish this function
	//Don't forget to handle both even and odd columns
	//And make sure that you check for the odd columns EFFICIENTLY
	unsigned short pixel = videoBuffer[OFFSET(row,col,240)/2];
	if(col & 1) {
		pixel &= 0xFF;
		videoBuffer[OFFSET(row,col,240)/2] = pixel | (colorIndex << 8);
	} else {
		pixel &= ~0xFF;
		videoBuffer[OFFSET(row,col,240)/2] = pixel | colorIndex;
	}
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source; 
	DMA[channel].dst = destination; 
	DMA[channel].cnt = DMA_ON | control; 
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], DMA_SOURCE_FIXED | width); 
    }   
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
	// TODO COMPLETE THIS FUNCTION !!!!
	// You will have to handle the even/odd cases (there are 4)
	// Do not simply change the row or col

	unsigned short pixels = colorIndex << 8 | colorIndex; // This combines the index into a short so we can copy it easily
	for(int r = 0; r < height; r++) {
		if(col & 1) {
			setPixel4(row + r, col, colorIndex);
			if(width & 1) {
				DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col+1,240)/2], width/2 | DMA_SOURCE_FIXED);
			} else {
				DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col+1,240)/2], (width/2 - 1) | DMA_SOURCE_FIXED);
				setPixel4(row + r, col + width - 1, colorIndex);
			}
		} else {
			if (width & 1) {
				DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col,240)/2], width/2 | DMA_SOURCE_FIXED);
				setPixel4(row + r, col + width - 1, colorIndex);
			} else {
				DMANow(3, &pixels, &videoBuffer[OFFSET(row+r,col,240)/2], width/2 | DMA_SOURCE_FIXED);
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
	//TODO: Write the DMA call that will draw a background image (an image that fills the entire screen)
	// Assume the image dimensions fit the screen perfectly
	//unsigned short imageM4 = image << 8 | image;
	DMANow(3, (unsigned short*)image, videoBuffer, (240*160)/2);
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, (unsigned short*)&image[OFFSET(i,0, width)], &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width));
	}
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width) {
	//TODO: Finish this function
	//If this image is being drawn on an odd column, just add 1 to the column and then draw it
	//unsigned short imagePixels = image << 8 | image;
	int i;
	if ((col & 1)) {
		col++;
	}
	for(i = 0; i < height; i++)
	{
		DMANow(3, (unsigned short*)&image[OFFSET(i,0, width)/2], &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)/2], (width)/2);
	}
}

void loadPalette(volatile const unsigned short* palette)
{
	// TODO: Finish this function
	// This function will load copy a palette to GBA's palette memory
    // HINT: there's a #define near the top of myLIb.h that has the pallette's address
    DMANow(3, palette, PALETTE, 256);
}

void fillScreen(unsigned short color)
{
	volatile unsigned short c = color;
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | 240 * 160); 
}

void fillScreen4(unsigned char colorIndex)
{
	//this line creates a short consisting of the data in colorIndex in the left side and right side
	volatile unsigned short pixels = (colorIndex << 8) | (colorIndex);

	//TODO: Write the DMA call that will fill the screen with the fill color
	DMANow(3, &pixels, videoBuffer, DMA_SOURCE_FIXED | (240 * 160)/2);
}

void flipPage()
{
    if(REG_DISPCTL & BUFFER2)
    {
        REG_DISPCTL &= ~BUFFER2;
        videoBuffer = backBuffer;
    }
    else
    {
        REG_DISPCTL |= BUFFER2;
        videoBuffer = frontBuffer;
    }
}

void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}