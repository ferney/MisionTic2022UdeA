import 'dart:io';
int a=0, b=0;
String opcion='';

void menu(){  
  print('2. sumar');
  print('3. restar');
  print('4. multiplicar');
  print('5. dividir');
  print('6. modulo');
  print('7. salir');
}

void asignar(){
  print('ingrese A');
  a=int.parse(stdin.readLineSync());
   print('ingrese B');
  b=int.parse(stdin.readLineSync());
}

void suma(){
  asignar();
  int suma=a+b;
  print('el resultado de la suma es $suma');
}

void restar(){
  asignar();
  int restar=a-b;
  print(restar);
}
void dividir(){
  asignar();
  double dividir=a/b;
  print(dividir);
}
void multiplicar(){
  asignar();
  int multiplicar=a*b;
  print(multiplicar);
}
void modulo(){
  asignar();
  int modulo=a%b;
  print(modulo);
}

void main(){
loop:while(true){
  menu();
  print('ingrese una opcion');
  opcion=stdin.readLineSync();
  //opcionde de cada caso con un switch
  switch(opcion){
    case '2':
      suma();
      break loop;
    case '3':
      restar();
      break loop;
    case '4':
      multiplicar();
      break loop;
    case '5':
      dividir();
      break loop;
    case '6':
      modulo();
      break loop;
    case '7':
      break loop;
  }
  print('######');
}
}
//////

import 'dart:io';
int x=0,y=0;
void menu(){ 
  print('1. Asignar valores');
  print('2. sumar');
  print('3. restar');
  print('4. multiplicar');
  print('5. dividir');
  print('6. modulo');
  print('7. salir');
}

int asignar() => int.parse(stdin.readLineSync());

int asignar2() {
  print('ingrese un numero');
  x = int.parse(stdin.readLineSync());
  return x;
}

int asignar3() {    
  print('ingrese un numero');
  String t = stdin.readLineSync();  
  y=int.parse(t);
  return y; 
}

int sumar(a,b,c) => a+b+c;



void main(){
  String opcion="";
  int a=0,b=0,c=0;
loop:while(true){
  menu();
  print('ingrese una opcion');
  opcion=stdin.readLineSync();
  //opcionde de cada caso con un switch
  switch(opcion){
    case '1':
      print('ingrese a');
      a=asignar();
      print('ingrese b');
      b=asignar2();
      print('ingrese c');
      c=asignar3();
      break;
    case '2':
      print('la suma es ${sumar(a,b,c)}');
      break loop;    
    case '7':
      break loop;
  }
  print('######');
}
}
