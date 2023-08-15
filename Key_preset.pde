void keyPressed(){
 switch(key){
   case 'd':
   case 'D':
     empujePersonaje('d');
     break;
   case 'a':
   case 'A':
     empujePersonaje('a');
     break;
   case 'w':
   case 'W':
     saltarPersonaje();
     break;
   case 'q':
   case 'Q':
     if(estado == 'A') estado = 'S';
     break;
   case 'E':
   case 'e':
     if(estado == 'S') estado = 'D';
     break;
   case 'R':
   case 'r':
     if(estado == 'D') estado = 'A';
     break;
 }
}
