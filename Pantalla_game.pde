float alturaMario = 0;
float anchoMario = 0;

//float pendiente = 0.04; 
float marioY;
float marioYi= 0;
float marioVy= 0;
float marioVyi = 0;
float marioAy = 0;
boolean estaSaltando = false;

float marioTx= 0;
float marioXi= 0;
float marioX = 100;
float marioVx= 0;
float marioVxi = 2;
boolean esEmpujado = false;

boolean camina1 = true;
float tiempo = 0;

int alternarPaso = 0;
void setupMario(){
  marioYi = height  -40;
  marioY = marioYi;
}

void empujePersonaje(char sentido) {
  if (!esEmpujado) {
    esEmpujado = true;
    if (sentido == 'd') {
      marioVx = marioVxi;
    } else if(sentido == 'a'){ 
      marioVx = -marioVxi;
    }
    marioTx = 0;
  }
}


void saltarPersonaje(){
  if (estaSaltando == false){
    estaSaltando = true;
    marioAy = 0.080;
    marioVyi = -2;
    tiempo =0 ;
  }
}
void dibujaPantallaGame(){
  
  background(255);
  image(imgGame ,width/2, height/2);
  if (estaSaltando == true){
    // Cálculo del tiempo para animar el salto
    tiempo = tiempo + 1;
    // Cálculo de la posición vertical durante el salto
    marioVy = marioVyi + marioAy*tiempo;
    marioY = marioYi + marioVyi * tiempo + 0.5* marioAy*tiempo*tiempo;
    // Controla cuando el personaje vuelve al suelo y termina el salto
    if (marioY > height -40) {
      estaSaltando = false;
      marioY = height -40;
      tiempo = 0;
      marioVyi = 0;
      marioAy = 0;
      marioVx = 0;
      esEmpujado = false;
      marioXi = marioX;
    }
  }
  
  if (esEmpujado == true) {
    marioTx = marioTx + 1;
  }
  
  // cálculos para el movimiento horizontal
  marioX = marioXi + marioVx * marioTx;
  
  // Calcular el sentido del movimiento del personaje
  char sentido = 'd';  // por defecto a la izquierda
  if (marioVx > 0){
    sentido = 'i';
  }
// Cambiar la dirección y el sentido del movimiento
  if (key == 'd' || key == 'D') {
    sentido = 'd';
    empujePersonaje('d');
  } else if (key == 'a' || key == 'A') {
    sentido = 'i';
    empujePersonaje('a');
  }

  // Animación del personaje mediante las imágenes
  if (estaSaltando){
    if (marioVy < 0) {
      flipImageH(marioSalto,marioX, marioY , sentido);
      } else {
      flipImageH(marioSalto,marioX,marioY, sentido);
      }
    } else{
    if (marioVx == 0) {  // Está quieto idle
      flipImageH(imgMario,marioX, marioY, sentido);
    } else {
      // Calcula el paso alternado
      if (marioTx % 5 == 0){
        alternarPaso++;
        alternarPaso = alternarPaso % 2;
      }
      // Dibuja la imagen que le toca
      switch(alternarPaso){
        case 0: // primer paso
          flipImageH(marioCamina1,marioX, marioY, sentido);
          break;
        case 1: // segundo paso
          flipImageH(marioCamina2,marioX, marioY, sentido);
          break;  
      }
    }      
  }
  barriles();
}
 
void flipImageH(PImage img, float X, float Y, char sentido) {
  pushMatrix();
  if (sentido == 'd') {
    image(img, X, Y, 60, 35);
  } else {
    scale(-1, 1);
    image(img, marioX, marioY,60,35);
  }
  popMatrix();
}
