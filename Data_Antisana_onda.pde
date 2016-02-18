/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 */
import de.looksgood.ani.*;
JSONObject json;
Ball [] ball;
Ball [] ball1;
PFont font;
Boolean adentro=false;
Boolean adentro1=false;

int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float amplitude = 50.0;  // Height of wave
float period = 200.0; // How many pixels before the wave repeats// cada cuantos pixeles se repite una onda
float period1 = 200.0;
float dx;  // Value for incrementing X, a function of period and xspacing
float dx1;
float[] yvalues;  // Using an array to store height values for the wave
float[] yvalues1;
float s1;
float angle;

void setup() {
  size(1280, 800); 
  Ani.init(this);
 font = loadFont("DINCondensed-Bold-48.vlw");
  s1=7;

  w = width;
  xspacing = w/263 + 10;
  dx = (TWO_PI/ period) * xspacing;
  dx1 = (TWO_PI/ period) * xspacing;
  yvalues = new float[263];
  yvalues1 = new float[263];
  json= loadJSONObject("taxonData.json");
  JSONArray taxon= json.getJSONArray("taxon");
    ball= new Ball[taxon.size()];
  ball1= new Ball[taxon.size()];
  for (int i=0; i<taxon.size (); i++) {
    JSONObject objetos= taxon.getJSONObject(i);
    String nombreTaxon=objetos.getString("nombre_cientifico_taxon");
      println(nombreTaxon);
      ball[i]= new Ball(i, nombreTaxon, i, s1,height/2,height/2);
      ball1[i]= new Ball(i, nombreTaxon, i, s1,height/2,height/2);
  }

}


void draw() {
  background(0);
  calcWave();
  renderWave();
  println(mouseY);
  
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  float a=map(mouseY, height/2, height, 0.00086, 0.05);
  theta += a;
  float x=theta;
  float x1=theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = cos(x)*amplitude;
    x+=dx;
  }
  for (int i = 0; i < yvalues.length; i++) {
    yvalues1[i]=sin(x1)*amplitude;
    x1+=dx1;
  }
}


void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ball[x].dibujar();
    if (ball[x].overCircle(ball[x].x1+10, ball[x].y1, ball[x].s)) {
      ball[x].agrandar();
       ball[x].agrandarImg();
    } else {  
      ball[x].reducir();
       ball[x].reducirImg();
    }
  }

  for (int x = 0; x < yvalues1.length; x++) {
    ball1[x].dibujar1();
    if (ball1[x].overCircle(ball1[x].x2+10, ball1[x].y2, ball1[x].s)) {
      ball1[x].agrandar();
       ball1[x].agrandarImg();
    } else {   
      ball1[x].reducir();
        ball1[x].reducirImg();
    }
  }
}

