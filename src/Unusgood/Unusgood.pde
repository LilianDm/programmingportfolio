// Andrei Jotic, Paul Schlegel, Jackson Payne, Sawyer Douthit, Lilian Dmitrieva, Frances Jones|
boolean play, turn, matchUnusCards;
PImage startScreen, display;
int r;
color c2;
ArrayList<Card> deck = new ArrayList<Card>();
ArrayList<Card> playerHand = new ArrayList<Card>();
ArrayList<Card> aiHand = new ArrayList<Card>();
ArrayList<Card> center = new ArrayList<Card>();
Button[] buttons = new Button[8];

void setup() {
  size (1000, 1000);
  background(245);
  play = false;
  populateDeck();
  c2 = color(255,0,0);
  buttons[0] = new Button(70, 800, 130, 200, c2, "1");
  buttons[1] = new Button(220, 800, 130, 200, c2, "2");
  buttons[2] = new Button(370, 800, 130, 200, c2, "3");
  buttons[3] = new Button(520, 800, 130, 200, c2, "4");
  buttons[4] = new Button(670, 800, 130, 200, c2, "5");
  buttons[5] = new Button(820, 800, 130, 200, c2, "6");
  buttons[6] = new Button(920, 800, 130, 200, c2, "7");
  buttons[7] = new Button(70, 600, 130, 100, c2, "DRAW");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(255);
    fill(27, 242, 75);
    display();
    
    

  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
    
    Trashtalk ();
    textSize(50);
  }
}
}
void populateDeck(){
  deck.add(new Card(color(240,17,17),1));
  deck.add(new Card(color(240,17,17),2));
  deck.add(new Card(color(240,17,17),3));
  deck.add(new Card(color(240,17,17),4));
  deck.add(new Card(color(240,17,17),5));
  deck.add(new Card(color(240,17,17),6));
  deck.add(new Card(color(240,17,17),7));
  deck.add(new Card(color(240,17,17),8));
  deck.add(new Card(color(240,17,17),9));
  deck.add(new Card(color(240,17,17),0));
  deck.add(new Card(color(16,110,229),1));
  deck.add(new Card(color(16,110,229),2));
  deck.add(new Card(color(16,110,229),3));
  deck.add(new Card(color(16,110,229),4));
  deck.add(new Card(color(16,110,229),5));
  deck.add(new Card(color(16,110,229),6));
  deck.add(new Card(color(16,110,229),7));
  deck.add(new Card(color(16,110,229),8));
  deck.add(new Card(color(16,110,229),9));
  deck.add(new Card(color(16,110,229),0));
  deck.add(new Card(color(75,180,55),1));
  deck.add(new Card(color(75,180,55),2));
  deck.add(new Card(color(75,180,55),3));
  deck.add(new Card(color(75,180,55),4));
  deck.add(new Card(color(75,180,55),5));
  deck.add(new Card(color(75,180,55),6));
  deck.add(new Card(color(75,180,55),7));
  deck.add(new Card(color(75,180,55),8));
  deck.add(new Card(color(75,180,55),9));
  deck.add(new Card(color(75,180,55),0));
  deck.add(new Card(color(227,218,39),1));
  deck.add(new Card(color(227,218,39),2));
  deck.add(new Card(color(227,218,39),3));
  deck.add(new Card(color(227,218,39),4));
  deck.add(new Card(color(227,218,39),5));
  deck.add(new Card(color(227,218,39),6));
  deck.add(new Card(color(227,218,39),7));
  deck.add(new Card(color(227,218,39),8));
  deck.add(new Card(color(227,218,39),9));
  deck.add(new Card(color(227,218,39),0));
}

void pullOut(int id) {
  deck.remove(id);
}

void startScreen () {
  startScreen = loadImage("unus.png");
  startScreen.resize(width, height);
  imageMode(CENTER);
  image(startScreen, width/2, height/2);
  textAlign(CENTER);
  fill(100);
  textSize(50);
  text("Welcome to Unus", width/2, 350);
  text("Java Group | March 2024", width/2, 475);
  text("Click to play...", width/2, 600);

  if (mousePressed) {
    play=true;
  }
}

void display() {

  display = loadImage("NPR.png");
  display.resize(200, 200);
  imageMode(CENTER);
  fill(0);
  textSize(80);
  text("Dave", width/2, 80);
  image(display, width/2, 200);
}

void Trashtalk () {
  int r = int(random(4));
  
}
