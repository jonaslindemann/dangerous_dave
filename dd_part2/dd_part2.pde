Cave cave;

boolean keyWasReleased;

void setup() 
{
    size(1024,768, P3D);
    
    cave = new Cave(20, 20, 1);
    cave.placePlayer();
    
    keyWasReleased = true;
} //<>//

void draw()
{
    background(0);
    
    if (keyPressed)
    {
        if (keyWasReleased)
        {
            keyWasReleased = false;

            switch(keyCode) 
            {
                case UP:
                    cave.movePlayer(-1,0);
                    break;                    
            }
        }
    }
    else 
        keyWasReleased = true;    
    
    cave.draw();
}  

/*
            switch(keyCode) 
            {
                case UP:
                    game.movePlayerUp();
                    break;
                case DOWN:
                    game.movePlayerDown();
                    break;
                case LEFT:
                    game.movePlayerLeft();
                    break;
                case RIGHT:
                    game.movePlayerRight();
                    break;
                case ESC:
                    giveUp = true;
                    break;
                    
            }
*/