#define OBSTACLECOUNT 5
//Prototypes
void update();
void draw();
void init();

//bird struct
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

//obstacles
typedef struct {
	int row, oldRow;
	int col, oldCol;
	int height;
	int width;
	//int colDel;
	int active; 
	//volatile const unsigned short* image;
	unsigned char color;
} PILLAR;