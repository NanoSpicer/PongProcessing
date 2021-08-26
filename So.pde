import ddf.minim.AudioPlayer;
import ddf.minim.Minim;


// Classe que facilita el maneig de sons
class So {

  Minim minim;
  private AudioPlayer player;
  
  public So(Minim min, String path_to_sound){
    minim = min;
    player = minim.loadFile(path_to_sound);
  }
  
  
  public void play(){
    player.rewind();
    player.play();
  }
  
  public void play_as_loop(){
    player.loop();
  }
  
  public void stop(){
    player.pause();
  }
  
  public void resume(){
    player.play();
  }
  
  public void skip(int millis){
    player.skip(millis);
  }

  public void setVolumen(double perCent){
    player.setGain((float)perCent);
  }
}