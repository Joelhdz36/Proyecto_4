//Agradecimientos especiales a Benjamin R. Moreno Ortiz por la elaboración del código que sirvió como base para la elaboración de este proyecto.


import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList <Figura> figuras;
PImage start, instruccion, importante, exit;
float lado = 25;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float deltaR, delta = 0;
float Color;
int value, screen;
void setup()
{
  start = loadImage("start.jpg");
  instruccion = loadImage("instruccion.jpg");
  importante = loadImage("importante.jpg");
  exit = loadImage("salida.jpg");
  size(900, 600);
  figuras = new ArrayList<Figura>();
  oscP5 = new OscP5(this, 900);
  for (float j = radio; j<=height; j+= altura) {
    int paso = (round((j - radio)/altura));
    float offset =0;
    if (paso%2 == 0) {
      offset = lado/2f;
    }
    for (float i =-offset; i<=width; i+= lado) {
      figuras.add(new Triangulo(i, j, lado, 0));
    }
    for (float i =lado/2f-offset; i<=width; i+= lado) {
      figuras.add(new Triangulo(i, j-apotema, lado, PI));
    }
  }
}

void draw()
{
  frameRate(30);
  background(random(value%255), value%255, value%255);
  delta += 0.01; 
  pintar();
  println(value);
  pantallas();

 
}


void keyReleased()
{
   if(screen == 0 & key == 's')
  {
   screen = 1;
   key = 'q';
  }
   if(screen == 1 & key == 's')
  {
   screen = 2;
   key = 'q';
  }
   if(screen == 2 & key == 's')
  {
   screen = 3;
   key = 'q';
  }
   if(screen == 3 & key == 's')
  {
   screen = 4;
   key = 'q';
  }
   if(screen == 4 & key == 'e')
  {
   screen = 0;
   key = 'q';
  }
}

void pintar()
{

  Color = (sin(delta)*155);
  if (Color <= 0)
  {
    Color*= (-1);
  }
  if (mousePressed)
  {
    deltaR = delta;
  }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/valor")==true)
  {
    value =theOscMessage.get(0).intValue();
  }
}