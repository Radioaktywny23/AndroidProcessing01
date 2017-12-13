import java.util.*;

class Universe{
   private int planetCounter = 0, moonCounter = 0;
   private Random rand = new Random();
   private Orb sun;
   private ArrayList<Orb> planets = new ArrayList<Orb>();
   private ArrayList<Orb> moons = new ArrayList<Orb>();
   
   private Orb randomPlanet(int planetCounter, int i, boolean isModel, PShape s){
     return new Orb(color(rand.nextInt(255),rand.nextInt(255),rand.nextInt(255)),
                           sun,
                           rand.nextFloat()*0.01+0.004*(planetCounter-i+1),
                           500-(380/planetCounter)*(planetCounter-i),
                           rand.nextInt(10)+10,
                           isModel,
                           s);
   }
   
   private Orb randomMoon(int moonCounter, int i, Orb planet, PShape s){
     return new Orb(color(rand.nextInt(255)),
                           planet,
                           rand.nextFloat()*0.04+0.04*(moonCounter-i+1),
                           50-(30/moonCounter)*moonCounter,
                           rand.nextInt(4)+4,
                           false,
                           s);
   }
   
  
   
   public Universe(boolean isModel, PShape s){
     planetCounter = 4;//rand.nextInt(9)+1;
     sun = new Orb(#FFE603,0,0,0,70);
     for(int i = 0; i<planetCounter; i++)
       planets.add(randomPlanet(planetCounter,i, isModel,s));
     for(Orb planet : planets){
       moonCounter = 2;//rand.nextInt(3);
       for(int i=0; i<moonCounter; i++)
         moons.add(randomMoon(moonCounter, i, planet,s));
     }
   }
   
   public void universeDraw(){
     sun.drawOrb();
     pointLight(255,255,255,0,0,0);
     spotLight(255,0,0,planets.get(0).getX()+planets.get(0).getSize(),planets.get(0).getY(),planets.get(0).getZ(),planets.get(0).getX()+400,planets.get(0).getY(),planets.get(0).getZ()-100,360,1);
     for(Orb b : planets)
       b.drawOrb(); 
     for(Orb b : moons)
       b.drawOrb();
   }
}