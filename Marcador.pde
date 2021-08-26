import java.awt.Color;

// Fa us de l'Ilustrador (per esser dibuixat a pantalla)
// Fa us de Actualitzacions (callback per actualitzar logica de la classe)
class Marcador implements Ilustrador, Actualitzacions{
  
  // Text del marcador
  private String text;
  // Pixels per cada caracter
  private final int k = 10; // Constant de pixels per caracter.
  // Color del text
  private Color colorText = Color.WHITE;
  
  // Punters al jugadors per poder fer el seguiment dels punts
  private Jugador j1, j2;
  
  public Marcador(Jugador j1, Jugador j2){
    this.j1 = j1;
    this.j2 = j2;
    text =j1.punts+" - "+j2.punts;   
  }
  
  
  public void actualitza(){
      text = j1.punts+" - "+j2.punts;
  }
  
  /**
   * Mostra el marcador a la pantalla.
   */
  public void pintar(){
    int altura_text = 30;
    textSize(altura_text);
    int llargaria_text = text.length()*k;
    
    fill(colorText.getRed(), colorText.getGreen(), colorText.getBlue());
    textAlign(CENTER);
    text(text, width/2 - llargaria_text/2, height-altura_text);
    
  }

}