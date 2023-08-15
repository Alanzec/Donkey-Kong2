PImage imgInicio;
PImage imgGame;
PImage imgGameOver;
PImage imgMario;
PImage marioCamina1;
PImage marioCamina2;
PImage imgBarril;
PImage imgKong;
PImage kongLanzamiento1;
PImage kongLanzamiento2;
PImage marioSalto;
PImage imgPeache;
void setup(){
  size(800,600);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  setupMario();
  imgGame = loadImage("01_fondo.png");
  imgGameOver = loadImage("02_gameOver.png");
  imgInicio= loadImage("03_pantallaInicio.png");
  imgMario= loadImage("04_mario.png");
  marioCamina1= loadImage("05_marioCorriendo1.png");
  marioCamina2= loadImage("06_marioCorriendo2.png");
  imgBarril= loadImage("07_barril.png");
  //imgKong= loadImage("08_kong.png");
 // kongLanzamiento1= loadImage("09_lanzamientoKong1.png");
  //kongLanzamiento2= loadImage("10_lanzamientoKong2.png");
  marioSalto= loadImage("11_marioSaltando.png");
  //imgPeache= loadImage("12_peache.png");
}
char estado = 'A'; 
void draw(){
  background(255);
  switch(estado){
    case 'A':
      image(imgInicio, width/2, height/2);
      break;
    case 'S':
      dibujaPantallaGame();
      break;
    case 'D':
      image(imgGameOver,width/2, height/2);
      break;
  }
  
}
