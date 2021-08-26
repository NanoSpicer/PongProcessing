import java.util.Random;

// Fa us de l'Ilustrador (per esser dibuixat a pantalla)
// Fa us de Actualitzacions (callback per actualitzar logica de la classe)
class Jugador implements Ilustrador, Actualitzacions{

  // Separació entre el canto de la pantalla i la pala
  public static final int distancia_borde = 10; 
  
  // Coordenades de la pala
  public int x, y;
  
  // Dimensions de la pala
  public final int ample = 20, llarg = 80;
  
  // Color de la pala del jugador
  private Color colo;
  
  // Puntuacio
  public int punts =0;
  // Bandol (dret o esquerre).
  public char side;
  
  /**
   *  CONSTRUCTORS.
   */
  public Jugador(Color ass, char side){
    colo=ass;
    this.side = side;
    if (side == 'l'){
      x = 0 + ample/2 + distancia_borde;
    }else if(side == 'r'){
      x = width - ample/2 - distancia_borde;
    }
    
    y = height/2;
  }
  
  
  public Jugador(char side){
    
    this.side = side;
    if (side == 'l'){
      x = 0 + ample/2 + distancia_borde;
    }else if(side == 'r'){
      x = width - ample/2 - distancia_borde;
    }
    
    y = height/2;
    colo = colorAleatori();
  }
  
  /**
   * Metode que crea un color aleatori. 
   */
  private Color colorAleatori(){
    int max = 256;
    int r, g, b;
    
    Random ran = new Random(System.nanoTime());
    
    r = ran.nextInt(max);
    g = ran.nextInt(max);
    b = ran.nextInt(max);
    
    Color alea = new Color(r, g, b);
  
    return alea;
  }
  
  /**
   *  Substituïr el codi d'aquest mètode per el del control desitjat.
   */
  public void actualitza(){
    
    if(mouseY<=0){
       y = this.llarg/2;
    }else if(mouseY>=height){
      y = height - this.llarg/2;
    }else{
      y=mouseY;
    }
  }
  
  /**
   *  Mètode que pinta la pala a pantalla.
   */
  public void pintar(){
    strokeWeight(ample);
    noStroke();
    noFill();
    stroke(colo.getRed(), colo.getGreen(), colo.getBlue());
    line(x, y - llarg/2, x, y + llarg/2);
    
  }
  public void printCoords(){
    System.out.println("Jugador "+side+": "+this.x+" - "+this.y);
  }
}