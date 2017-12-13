class Orb{
  private color c;
  private float X=0, Y=0, Z=0, speed=0, radius=0, timer=0, size=0;
  private Orb parent;
  private boolean isOrbiting = false, isModel;
  private PShape s;
  
  public Orb(color c, float X, float Y, float Z, int size){ //Sun constructor
    this.c = c;
    this.X = X;
    this.Y = Y;
    this.Z = Z;
    this.size = size;
  }
  
  public Orb(color c, Orb parent, float speed, float radius, int size, boolean isModel, PShape s){ //Planet/Moon constructor
    this.s = s;
    this.c = c;
    this.parent = parent;
    this.speed = speed;
    this.radius = radius;
    this.size = size;
    isOrbiting = true;
    this.isModel = isModel;
  }
  
  public float getX(){ return X+radius*sin(timer); }  
  public float getY(){ return Y+radius*-cos(timer); }
  public float getZ(){ return Z;}
  public float getSize(){ return size; }
  
  public void drawOrb(){
    pushMatrix();
    noStroke();
    fill(c);
    if(isOrbiting){
      translate(parent.getX(),parent.getY(),parent.getZ());
      rotateZ(timer);
      translate(0,-radius,0);
      X=parent.getX();
      Y=parent.getY();
    }
    else translate(X,Y,Z);
    if(isOrbiting && isModel){
      scale(size/2);
      rotateY(90);
      shape(s,0,0);
      scale(1/size*2);
    }
    else if(isOrbiting) sphere(size);
    else sphere(size);
    timer+=speed;
    popMatrix();
  }
}