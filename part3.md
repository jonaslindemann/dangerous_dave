# Dangerous Dave - Del 3

I denna del skall vi lägga till menyer, trillande stenar och poängräkning.

## Spellägen

Det flesta spel har normalt ett antal olika lägen som man växlar mellan typiskt:

 1. Menyläge
 1. Spelläge
 1. Spel avslutat
 1. Avsluta

Vi definierar dessa i huvudprogrammet som konstanter för att lättare hålla reda på dessa i resten av programmet.

```java
// Variabler för spellägem

final int MENU = 0;
final int PLAYING = 1;
final int GAME_OVER = 2;
final int QUIT = 3;
```

Vi lägger också till en variabel som anger vilket läge vi befinner oss i:

```java
int gameMode;
```

Vi skall också lägga till en varibel för menyn:

```java
// Vår spelklass

Game game;
Menu menu; // <----
```

I setup() lägger initierar vi gameMode variabeln och meny-objektet:

```java
void setup() 
{
    // Definiera storleken på fönstret
    
    size(1024,768, P3D);
            
    // Sätt flagga för att hålla koll på när en tangent släpps upp.
    
    keyWasReleased = true;
    
    // Sätt game mode till menu
    
    gameMode = MENU;
    
    // Skapa vår meny
    
    menu = new Menu();
    menu.title = "Mitt spel";
    ...
```

Ändra menu.title till namnet på ditt spel.

Vi kan också lägga till en bakgrundsbild i meyn genom följande kod:

```java
    menu.backgroundImage = loadImage("menu.png");
```

Bildfilen som anges i loadImage(...) läggs i mappen data i sketch-foldern. **menu.png** följer med i mallen för spelet.

Menyerna i spelet läggs till genom att anropa metoden add(...) på menu-objektet. I detta läge behöver vi 2 menyalternativ, ett alterntiv för att starta spelet och ett för att avsluta spelet. Menyn för att starta spelet läggs till med följande kommando:

```java
    menu.add("Starta");
```

### Uppgift 1 - Lägg till menyn "Avsluta".

I nästa steg skall vi dela upp **draw()** metoden i delar som motsvara våra spellägen. Vi börjar med att lägga till meny-läget:

```java
void draw()
{
    // Rensa bakgrund
    
    background(0);
    
    if (gameMode == MENU)
    {
        menu.draw();
    }
```

Koden vi skrev för spelläget skall läggas in i spelläget **PLAYING**

```java
    if (gameMode == PLAYING)
    {
        
        // Är en tangent nertryckt?
        
        if (keyPressed)
        {
            ...
        }
        else 
            keyWasReleased = true; // Om keypressed inte är sann har tangenten släppts upp.    
        
        // Rita vår grotta.
        
        game.draw();
    }
```

När vi ändå är i farten lägger vi till till spelläget **GAME_OVER** och **QUIT**:

```java
    if (gameMode == GAME_OVER)
    {
        gameMode = GAME_MENU
    }
    
    if (gameMode == QUIT)
        exit();
```

Det vi gjort nu är att dela upp **draw()** rutinen i ett antal delar som anropas beroned på vilket spelläge vi befinner oss i. Kör vi programmet nu skall en meny visas på skärmen. Menyn är dock inte aktiv. Detta skall vi ändra på i nästa steg:

## Spelmenyn

I spelmenyer brukar man kunna ändra alternativ för spelet, starta spelet och avsluta spelet. För att menyn skall fungera måste vi först lägga till ett anrop till **menu.checkKeys()**. Denna funktion hanterar val i menyn. Om ett val i menyn gjorts returnerar **menu.isSelected()** true. Vilket alternativ som valts kan man ta reda på genom att anropa **menu.selected()**. Med hjälp av dessa funktioner kan vi nu sätta ihop koden som behövs för att menyn skall kunna fungera:

```java
    if (gameMode == MENU)
    {
        menu.draw();
        menu.checkKeys();
        
        if (menu.isSelected())
        {
            if (menu.selected()==0)
            {
                game = new Game(20, 20, 3);
                game.placePlayer();
                
                gameMode = PLAYING;
                
            }    

            // Här skall avsluta menyn läggas till

            menu.reset();
        }
    }
```
 
### Uppgift 2 - Lägg till en if-sats för alternativet avsluta






