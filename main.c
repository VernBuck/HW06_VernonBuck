#include <stdio.h>
#include "myLib.h"

// bird image data
#include "bird1fix.h"
#include "Bird2fix.h"
#include "Bird3fix.h"
#include "titlegame.h"
#include "loss.h"
#include "Instructions1.h"

#include "draw.h"
#include "main.h"
#include "update.h"

unsigned int buttons; 
unsigned int oldButtons;

//pause text
char buffer1[41];

//timer variables
int timer;
int timer2;
int timer3;

int timetoNext;
int activeTimer;

int obstacleCount;

int lost = 0;

int arr[4] = {70, 50, 60, 80};
int arr2[4] = {0, 80, 30, 110, 70, 60, 50};

// holds the attribute for the bird object
BIRDSTRUCT bird;

// array of upper
PILLAR upperObs[1];
// array of lower
PILLAR lowerObs[1];

//game states for state machine
int state;
enum {INSTRUCTION, STARTSCREEN, GAMESCREEN, LOSESCREEN, PAUSESCREEN };

/************************* Main Loop *************************/
int main()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;
    goToInstruction();
    while(1)
    {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch(state) {
        	case INSTRUCTION:
        		updateInstruction();
        		break;
        	case STARTSCREEN:
        		updateStart();
        		break;
        	case GAMESCREEN:
        		updateGame();
        		break;
        	case LOSESCREEN:
        		updateLose();
        		break;
        	case PAUSESCREEN:
        		updatePause();
        		break;
        }
    }
}

/*********************** Initializer *********************/
void init()
{
	//TODO: Load the bird1Pal palette with a function you implemented in myLib.c
	loadPalette(bird1fixPal);
	PALETTE[16] = YELLOW;
	PALETTE[15] = GREEN;
	PALETTE[0] = BLACK;
	
	//bird settings
	bird.row = 80;
	bird.col = 80;
	bird.width = 20;
	bird.height = 20;
	bird.rowDel = 0;
	bird.colDel = 0;

	//upper pillar settings
	PILLAR upper;
	upper.oldRow = 0;
	upper.oldCol = 0;
	upper.row = 60;
	upper.col = 180;
	upper.width = 50; 
	upper.height = 50;
	upper.active = 0;

	obstacleCount = (sizeof(upper)/sizeof(upperObs[0]));

	for(int i = 0; i < obstacleCount; i++) {
		upperObs[i] = upper;
	}

	activeTimer = 0;
}

/*********************** Updater *********************/
void update()
{

	//creates obstacles to be evaded
	if(!(++activeTimer % timetoNext)) {
		for(int i = 0; i < obstacleCount; i++) {
			PILLAR * p = &upperObs[i];
			if(!(p -> active)) {
				//setting p values
				p -> active = 1;
				p -> row = arr2[rand()%7];//80;//0;
				p -> width = 30;
				p -> height = 30;
				p -> col = 200;
				p -> color = 15;
				p -> oldCol = p -> col;
				p -> oldRow = p -> row;

				timetoNext = 80;
				break;
			}
		}
	}

	timer2++;
	timer3++;
	if(timer2 % 5 == 0)
	{
		timer++;
		timer %= 4;
	}
	if(timer3 % 10 == 0) {
		updateDrop(&bird);
	}
	updatePlayer(&bird);

	for (int i = 0; i < obstacleCount; i++) {
		updatePillar(&upperObs[i]);
		if ((collisionCheckObstacleTarget(&bird, &upperObs[i]) == 1)) {
			lost++;
			goToLose(); 
		}
	}
}

/*********************** Drawer *********************/

void draw()
{
	//creates animation via times
	switch(timer)
	{
		case 0:
			bird.image = bird1fixBitmap;
			drawBird(&bird);
			break;
		case 1:
			bird.image = bird2fixBitmap;
			drawBird(&bird);
			break;
		case 2:
			bird.image = bird3fixBitmap;
			drawBird(&bird);
			break;
	}

	//draws every obstacle
	for(int i = 0; i < obstacleCount; i++) {
		PILLAR * p = &upperObs[i];
		drawPillar(p);
	}
	flipPage();
}

/*********************** State Controller *********************/
void goToInstruction() {
	loadPalette(Instructions1Pal);
	drawImage4(Instructions1Bitmap, 0, 0, 160, 240);
	flipPage();
	drawImage4(Instructions1Bitmap, 0, 0, 160, 240);
	state = INSTRUCTION;
}

void updateInstruction() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}
void goToStart() {
	loadPalette(titlegamePal);
	drawImage4(titlegameBitmap, 0, 0, 160, 240);
	flipPage();
	drawImage4(titlegameBitmap, 0, 0, 160, 240);
	state = STARTSCREEN;
}

void updateStart() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		init();
		goToGame();
	}
}

void goToGame() {
	fillScreen4(0);
	flipPage();
	fillScreen4(0);
	state = GAMESCREEN;
}

void updateGame() {
    update();
    waitForVBlank();
    draw();
    if(BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    }
}

void goToPause() {
	state = PAUSESCREEN;
	drawString(80, 60, buffer1, 15);
	sprintf(buffer1, "Games lost!  %d", lost); 
	flipPage();
	drawString(80, 60, buffer1, 15);
	sprintf(buffer1, "Games lost!  %d", lost); 
}

void updatePause() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}
}

void goToLose() {
	fillScreen(RED);
	state = LOSESCREEN;
}

void updateLose() {
	loadPalette(lossPal);
	drawBackgroundImage4(lossBitmap);
	flipPage();
     if(BUTTON_PRESSED(BUTTON_START)) {
     	init();
		goToStart();
	}
}
