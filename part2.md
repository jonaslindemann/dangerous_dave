# Dangerous Dave - Del 2

I denna del skall vi lägga till funktioner för att flytta vår hjälte i labyrinten. Om ni inte hunnit med kan ni ladda ner en mall för vad vi gjorde förra gången på hemsidan.

För att hålla koll på var vår hjälte befinner sig lägger vi till 2 variabler i klassen Cave, playerRow, playerCol. 

```java
class Cave extends Map {

    ...
    
    int nBoulders;
    int nEmpty;
    int nDiamonds;
    
    int playerRow;
    int playerCol;        
    
    public Cave(int rows, int cols, int factor)

    ...
```

För att kunna rita ut vår hjälte behöver vi också ladda in en bild för honom. För detta skall vi använda en s.k. tilemap. Detta är en bild som består av många varianter av vår spelare. Tilemap:en vi skall använda här finns i bilden **player.png** i data-mappen i spelet och ser ut så här:

![Alt text](dd_part2/data/player.png)

Vi börjar enkelt genom att läsa in bilden och kopiera översta bilden till en ny bildvariabel. Följande kod i **Cave()** gör detta:

```java
// Skapa en tom bild med 32 x 32 pixlar

playerImage = createImage(32,32,ARGB);

// Läs in hela tilemap:en

playerTileImage = loadImage("player.png");

// Kopiera 32 x 32 pixlar från övre hörnet.

playerImage.copy(playerTileImage, 0 * 32, 0 * 32, 32, 32, 0, 0, 32, 32);
```     

Nu behöver vi en funktion som placerar ut spelare någonstans i vår grotta. I Cave-klassen lägger vi till en funktion **placePlayer()**:

```java
void placePlayer()
{
    playerRow = int(random(nRows-2))+1;    
    playerCol = int(random(nCols-2))+1;
            
    map[playerRow][playerCol] = PLAYER;
    centerViewPort(playerRow, playerCol);
}  
```       

**Tänk på**: När man lägger till funktioner till vår **Cave**-klass är det viktigt att dessa hamnar mellan klassens "{" "}" precis som i följande exempel:

```java
class Cave extends Map {

    ...

    void placePlayer()
    {
        playerRow = int(random(nRows-2))+1;    
        playerCol = int(random(nCols-2))+1;
                
        map[playerRow][playerCol] = PLAYER;
        centerViewPort(playerRow, playerCol);
    }  

    ...

} 
```

För att spelare skall synas i grottan måste vi anropa funktionen från Cave()

```java
public Cave(int rows, int cols, int factor) 
{
    super(rows, cols, factor);

    ...

    createDiamonds();
    placePlayer(); // <--- Lägg till detta anrop
}
```

Kör vi vårt spel nu kommer inte spelaren att visas i grottan. Detta beror på att vi inte ritar ut spelarbilden i vår uppritningsfunktion **drawCell(...)**. Lägg till följande i **drawCell(...)**:

```java
void drawCell(int cellType, int x, int y)
{
    switch(cellType)
    {
        ...

        case PLAYER:
            // Lägg till kod för att rita upp spelaren här. 
            break;
        case OUTSIDE:
            break;
    }
}
```

# Uppgift 1 

Lägg till kod för att rita upp spelaren i **drawCell(...)**

