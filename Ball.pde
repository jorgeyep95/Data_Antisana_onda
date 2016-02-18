class Ball {

  int x;
  color col;
  String nombre;
  float x1, y1;
  float x2, y2;
  float s;
  float es;
  float m,m1;
  int id;
  String [] colores= {
    "ff065143", 
    "ff2ebe62", 
    "ff00a878", 
    "ff7dc95e", 
    "ffbef2b3",
  };
  Ball (int x_, String nombre_, int id_, float s_,float m_,float m1_) {

    textFont(font);
    textAlign(CENTER);
    textSize(50);
    x=x_;
    id=id_;
    nombre=nombre_;
    col=color(unhex(colores[int(random(5))]));
    s=s_;
    es=10;
    m=m_;
    m1=m1_;
  }

  void dibujar() {
    fill(col);
    m= mouseY;
    x1= x*xspacing;
    y1= m+yvalues[x];
    ellipse(10+x1, y1, s, s); 
    ellipse(width/2, 0.2*height, es, es);
    //textSize(10);
    //text(id,10+x1,y1+100);
    if (adentro) {
      text(nombre, width/2, 0.9*height);
      ellipseMode(CENTER);
    }
  }
  void dibujar1() {
    fill(col);
    m1=mouseY;
    x2= x*xspacing;
    y2= m1+yvalues1[x];
    ellipse(10+x2, y2, s, s); 
    ellipse(width/2, 0.2*height, es, es);
    //textSize(10);
    //text(id,10+x1,y1+100);
    if (adentro1) {
      text(nombre, width/2, 0.7*height);
      ellipseMode(CENTER);
    }
  }
  void agrandar() {
    Ani.to(this, 1.5, "s", 24);
  }
  void reducir() {
    Ani.to(this, 3, "s", 7);
  }
  void agrandarImg() {
    Ani.to(this, 1.1, "es", 200);
  }
  void reducirImg() {
    Ani.to(this, 1, "es", 0.1);
  }
  boolean overCircle(float x, float y, float diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      adentro=true;
      adentro1=true;
      return true;
    } else {
      adentro=false;
      adentro1=false;
      return false;
    }
  }
}

