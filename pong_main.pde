/**
 *  @author: Miquel Àngel Román
 */
import java.awt.Color;


Color backgroundColor = Color.WHITE;
Marcador m;
Jugador j1, j2;
Bolla bolla;

static SoundManager spaghetti;

/**
 * ADAPTAR EL CONTROLS DELS JUGADORS
 * AIXI COM ES DESITJI A LA CLASSE JUGADOR.
 */
void setup(){
  
  spaghetti = new SoundManager(new Minim(this));
  
  size(1400 , 760);
  frameRate(60);
  

  j1 = new Jugador('l');
  j2 = new Jugador('r');
  m = new Marcador(j1, j2);  
  bolla = new Bolla(j1, j2);
  
  new_match();
                           
}

void draw(){
  clear();
  
  j1.actualitza();
  j2.actualitza();
  bolla.actualitza();
  
  if(bolla.gol){
    spaghetti.playGol();
    bolla.getGuanyador().punts++;
    m.actualitza();
    bolla = new Bolla(j1,j2);
    new_match();
    delay(2000);
  }
  
  
  j1.pintar();
  j2.pintar();
  bolla.pintar();
  m.pintar();
}

void new_match(){
  spaghetti.play_PartidaNova();
  spaghetti.playMusic();
}