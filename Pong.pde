int XSphere;
float YSphere;
int X1barreDroite, Y1barreDroite;
int X1barreGauche, Y1barreGauche;
int iX; //Incrementation X
int iY; //Incrementation Y

int iYB1 = 0 ; //Increntation barre gauche Y
int iYB2 = 0; //Increntation barre droite Y
int compteurJ1, compteurJ2;
boolean flagStart = false;
void compteur()
{
  textSize(32);
  text(compteurJ2, 300, 100);
  text(compteurJ1, 700, 100);
  if (XSphere>=width)
  {
    compteurJ2++;
    XSphere = 500;
    YSphere = 250;
    flagStart=false;
  }
  if (XSphere<=0) {
    compteurJ1++;
    XSphere = 500;
    YSphere = 250;
    flagStart=false;
  }
} 

void dessin_objets(int Y1, int Y2)
{

  Y1barreGauche = Y1barreGauche + Y1;
  Y1barreDroite = Y1barreDroite + Y2;
  XSphere = XSphere + iX;
  YSphere = YSphere + iY;
  rect(X1barreDroite, Y1barreDroite, 10, 125);
  rect(X1barreGauche, Y1barreGauche, 10, 125);
  noStroke();
  ellipse(XSphere, YSphere, 25, 25);
  stroke(255);
  line(500, 0, 500, 500);
}
void Debut()
{
  if (!flagStart) {
    stroke(255);
    text("Appuyez sur R pour démarrer", 250, 50);
    if (keyPressed) 
    {
      if (key == 'r' || key == 'R') {
        flagStart=true;
        iX = 5;
        iY = 3;
      }
    }
  }
}
void mouvementBalle()
{
  if (YSphere-25<=0)
  {
    iY = -iY;
  }
  if (YSphere+25>=height)
  {
    iY = -iY;
  }
  if ((XSphere+25) == (X1barreDroite - 5) && YSphere>=Y1barreDroite && (Y1barreDroite +125)>=YSphere)
  {
    iX = -iX;
  }
  if ((XSphere-25) == (X1barreGauche + 5) && YSphere>=Y1barreGauche && (Y1barreGauche +125)>=YSphere)
  {
    iX = -iX;
  }
}
void mouvementBarreTouche()
{

  if (keyPressed) {
    //if (Y1barreGauche<=125) {
    if (key == 'z' || key == 'Z') {
      iYB1= -5;
    }
    if (key == 's' || key == 'S') {
      iYB1= 5;
    }
    if (key == '8') {
      iYB2= -5;
    }
    if (key == '5') {
      iYB2=  5;
    }
  } else
  {
    iYB1=0;
    iYB2=0;
  }
}

void setup () {
  size(1000, 500);
  XSphere = 500;
  YSphere = 250;
  X1barreGauche = 100;
  Y1barreGauche = 175;
  X1barreDroite = 900;
  Y1barreDroite = 175;
  iX = 5;
  iY = 1;
}

void draw()
{
  background(0);
  Debut();
  compteur();
  if (flagStart) {
    dessin_objets(iYB1, iYB2);
    mouvementBarreTouche();
    mouvementBalle();
  }
  //stroke(255);
  //line(500,0,500,500);
  //textSize(32);
  //text(compteurJ2, 300,100);
  //text(compteurJ1, 700,100);
  //if (YSphere <=0 || YSphere >=height)
  //{
  //iY= -iY;
  //}
  //if (XSphere == X1barreDroite || YSphere >=height)
  //{
  //iX= -iX;
  //}
  //if (XSphere>=width)
  //{
  //  compteurJ2++;
  //}
  //if (XSphere<=0){
  //  compteurJ1++;
  //  XSphere = 500;
  //  YSphere = 250;
  //}
}
