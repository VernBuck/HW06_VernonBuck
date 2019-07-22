#include "main.h"
#include "myLib.h"
#include "update.h"

//Updates the position of the player

//Checks whether or not the bouncing box collides
// adapted recitation method
// sends value to update box to determine movement route

/*int gbaCollision(BIRDSTRUCT* p) {
	if (160 < p->height + p->row + p->rowDel) {
		return 2;
	} else if(p-> col < 0) {
		return 3;
	} else if(240 < p->width + p->col+ p->colDel) {
		return 1;
	} else if(0 > p->row) {
		return 0;
	}
	return -1;
}*/

//Changes the position of the player with user input
//Prevents player from moving past 0 and 240 gba width
// lab code written by me
void updatePlayer(BIRDSTRUCT* p) {
	//says what to make blue and what to make black in terms of movement
	p->oldRow = p->row;
	p->oldCol = p->col;

	if(BUTTON_HELD(BUTTON_UP)) {
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

/*
//checks if the ball collides with the paddle (blue line) 
//adapted recitation code one significant change made upon collision
void collisionCheckObstaclePlayer(PLAYERITEMS* b, PLAYERITEMS* p)
{
	if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row)
	{
		b->rowDel = -b -> rowDel;
	}
}*/

//collision code written by me if the ball hits a target box color over it
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

//changes the box as it moves
//adapted from recitation several modifications made
/*void updateBox(PLAYERITEMS* b) {
	//first save the old position of the box (for erasing)
	b->oldRow = b->row;
	b->oldCol = b->col;

	//first we update the row and column by the delta
	b->row += b->rowDel;
	b->col += b->colDel;

	int edgeCollision = gbaCollision(b);
	//directional influence based on edgeCollision value
	if(edgeCollision == 0 || edgeCollision == 2) {
		b->rowDel = -b->rowDel;
		if (edgeCollision == 2) {
			// loss condition met here
			// changes state when hitting the bottom
			goToLose();
		}
	} else if(edgeCollision == 1 || edgeCollision == 3) {
		b->colDel = -b->colDel;
	}

	b->collisionChecked = 0;
}*/