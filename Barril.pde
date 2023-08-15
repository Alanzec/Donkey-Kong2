float xi= 300;
float yi = 190;
float x= 350;
float y = 190;
float Vxi = 1;
float Vyi = 0.08;
float Ayi = 0.002;
float t = 0;

boolean cae = false;
int plano = 1;

void barriles(){
  
  t =t +1;
  
  if (t <= 300) {
    x  = xi + Vxi*t;
    y  = yi + Vyi*t;
  } else {
    cae = ! cae;
    y = yi-80 +Vyi*t+0.5*Ayi*t*t;
    if (y>145*plano+100) {
      if (cae == true){
        t = 0;
        xi = x;
        yi = y;
        Vxi = -Vxi;        
        cae = false;
        plano = plano +1;
      }
    }
  }
  // dibujar
  image(imgBarril,x,y,25,25);
}
