#include "myLib.h"
#include "main.h"

//Player drawing function
//draws new player box and colors over old one
//adapted from recitation
void drawBird(BIRDSTRUCT* b) {
	drawRect4(b->oldRow -10, b->oldCol - 10, b->height + 20, b->width + 20, BLACK);
	drawImage4(b -> image, b -> row, b -> col, b -> width, b -> height);
}

void drawPillar(PILLAR *b) {
	//drawRect4(b->oldRow, b->oldCol, b->height, b->width+5, 0);
	if(b->active) {	
		drawRect4(b->oldRow, b->oldCol, b->height, b->width+5, 0);
		drawRect4(b -> row, b -> col, b -> height, b -> width, b -> color);
	} else {
		drawRect4(b->oldRow, b->oldCol, b->height, b->width+5, 0);
	}
}

/*void drawPillar2(PILLAR *b) {
	drawRect4(b->oldRow, b->oldCol, b->height, b->width + 5, 0);
	drawRect4(b -> row, b -> col, b -> height, b -> width, b -> color);
}*/