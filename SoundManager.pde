// Classe que facilita el maneig de sons
class SoundManager{

  // Ajustar en funcio de la musica
  private final static int music_offset = 60000;
  
  // Noms de fitxers constants  
  static final String colisio_file = "rebot.mp3";
  static final String gol_file = "gol.mp3";
  static final String match_sound_file = "start.mp3";
  static final String musica_file ="musica.mp3";
  
  // Sons que manejará el programa.
  private So colisio;
  private So gol;
  private So match_start;
  private So musica;
  
  public SoundManager(Minim min){
    colisio = new So(min, colisio_file);
    gol = new So(min, gol_file);
    match_start = new So(min, match_sound_file);
    musica = new So(min, musica_file);
  }
  
  
  public void playMusic(){
    musica.setVolumen(-24);
    musica.play_as_loop();
    musica.skip(music_offset);
  }
  
  public void playGol(){
    gol.play();
  }
  
  public void playRebot(){
    colisio.play();
  }
  
  public void play_PartidaNova(){
    match_start.setVolumen(-14);
    //match_start.play();
  }
}