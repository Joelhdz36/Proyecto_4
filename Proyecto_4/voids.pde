void pantallas()
{
  switch(screen)
  {
  case 0:
    inicio();
    break;

  case 1:
    instrucciones();
    break;

  case 2:
    Info();
    break;
    
  case 3:
    salida();
    break;

  case 4:
    Particulas();
    break;
  }
}

void inicio()
{
  background(start);
}

void instrucciones()
{
  background(instruccion);
}

void Info()
{
  background(importante);
}
void salida()
{
 background(exit); 
}

void Particulas()
{
  figuras.get(round(value)%2058).display();
  figuras.get((value-300)%300).display();
  figuras.get(value+20).display();
  figuras.get(value%1000).display();
  figuras.get(value%970).display();
  figuras.get((value+700)%2058).display();
  figuras.get(value+400).display();
  figuras.get((value*2)%2058).display();
}