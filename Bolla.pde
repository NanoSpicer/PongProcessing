import java.awt.Color;

// Fa us de l'Ilustrador (per esser dibuixat a pantalla)
// Fa us de Actualitzacions (callback per actualitzar logica de la classe)
class Bolla implements Actualitzacions, Ilustrador {

  private Jugador j1, j2;
  private Jugador guanyador;
  
  private int x, y;
  private final static int init_spd = 5; //px/update
  private final static double acceleracio = 0.5;
  private double dx, dy;
  
  private Color col = Color.WHITE;

  private final static int radi = 15;
  
  boolean gol = false;
  
  public Bolla(Jugador j1, Jugador j2) {
    guanyador = null;
    this.j1=j1;
    this.j2=j2;
    x = width/2;
    y = height/2;

    dx = dy = init_spd;

    Random ran = new Random(System.nanoTime());

    if (ran.nextInt(2)==0) dx = -dx;
    if (ran.nextInt(2)==0) dy = -dy;
  }

  public void pintar() {
    strokeWeight(1); // Restore default value!
    noFill();
    noStroke();
    fill(col.getRed(), col.getGreen(), col.getBlue());
    stroke(col.getRed(), col.getGreen(), col.getBlue());
    ellipse(x, y, 2*radi, 2*radi);
  }

  public void actualitza(){
    x = x + (int) dx;
    y = y + (int) dy;
    
    rebotar_eix_y();
    rebotar_eix_x();
  }
  
  private void rebotar_eix_y(){
    
    boolean rebota = false;
    
    if(this.y-radi <= 0){
      rebota = true;
      y = radi;
    }
    
    if(this.y+radi >= height){
      rebota = true;
      y = height -radi;
    }
    
    if(rebota){
      col = colorAleatori();
      dy=-dy;
    }
  }
  
  private void rebotar_eix_x(){
    
    Jugador a_tractar;
    boolean rebot = false;
    
    
    // Si la X esta més aprop de 0, el jugador a analitzar és l'esquerre
    if(this.mesApropDe(0, width, this.x)){
      a_tractar = getLeftPlayer();
      if((this.x -radi) <= a_tractar.x){
        if(this.y < (a_tractar.y - (a_tractar.llarg/2)) || this.y > (a_tractar.y + (a_tractar.llarg/2))){
          this.gol = true;
          guanyador = getRightPlayer();
        }else{
          rebot = true;
        }
      }
    }else{
      a_tractar = getRightPlayer();
      
      if((this.x+radi) >= a_tractar.x){
        if(this.y < (a_tractar.y - (a_tractar.llarg/2) - (a_tractar.ample/2)) || this.y > (a_tractar.y + (a_tractar.llarg/2) + (a_tractar.ample/2))){
          this.gol = true;
          guanyador = getLeftPlayer();
        }else{
          rebot = true;
        }
      }
    }
    
    if(!this.gol && rebot){
      // Fer el so de rebot.
      pong_main.spaghetti.playRebot();
      if(a_tractar.side == 'l'){
        this.x = a_tractar.x+radi+(a_tractar.ample/2);
      }else{
        this.x = a_tractar.x-radi-(a_tractar.ample/2);
      }
      
      
      if(dx<0){
        dx-=acceleracio;
      }else{
        dx+=acceleracio;
      }
      dx=-dx;
      col = colorAleatori();
    }
  }
  
  private Jugador getLeftPlayer(){
    if(j1.side=='l') return j1;
    return j2;
  }
  
  private Jugador getRightPlayer(){
    if(j1.side=='r') return j1;
    return j2;
  }
  
  public Jugador getGuanyador(){
    return guanyador;
  }
  
  /**
  *  Compara si @param esta mes aprob de A que de B. Si param esta mes aprop de A que de B retorna true;
  */
  private boolean mesApropDe(int a, int b, int param){
    return (param-a<b-param);
  }
  

  private Color colorAleatori() {
    int max = 256;
    int r, g, b;

    Random ran = new Random(System.nanoTime());

    r = ran.nextInt(max);
    g = ran.nextInt(max);
    b = ran.nextInt(max);

    Color alea = new Color(r, g, b);

    return alea;
  }
  
}