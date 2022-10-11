/**
 *   Un operador es un símbolo que le dice al compilador
 *   qué debe de realizar una tarea 
 *   matemática, relacional o lógica 
 *   y debe de producir un resultado
 */

main() {

  int a = 10 + 5;  //   +   15
  a = 20 - 10;     //   -   10
  a = 10 * 2;      //   *   20
  
  double b = 10 / 2;  //   /   5
  b = 10.0 % 3;       //   %   1  El sobrante de la división
  b = -b;             //   -expr  Es usado para cambiar el valor de la expr

  int c = 10 ~/ 3;    //   ~/  3   División común y corriente


  int d = 1;

  d++;                //  ++   2
  d--;                //  --   1  
  
  d += 2;             //  +=   3
  d -= 2;             //  +=   1    *=    /=


}
///////////////////////////////////////////
main() {

  var a   = 10;
  final double b = 10;
  const double c = 10;

  // a = 20;
  // b = 20;
  // c = 20;

  // final personasFinal = ['J', 'P', 'F'];
  // const personasConst = ['J', 'P', 'F'];

  final List<String> personasFinal = ['J', 'P', 'F'];
  List<String> personasConst = const['J', 'P', 'F'];

  personasFinal.add('Maria');
  // personasConst.add('Maria');

  // personasFinal = [];
  

  print(personasConst);
}

  
  ////////////////////////////////////////////////

main() {

  // Operadores de asignación
  int a; // = 10;
  int b; // = 1;

  // b ??= 20; // Asignar el valor únicamente si la variable es null

  // print(b);


  // Operadores condicionales
  int c = 28;
  String resp = c > 25 ? 'C es mayor a 25' : 'C es menor a 25';

  // print(resp);

  int d = b ?? a ?? 100;
  // print(d);

  // Operadores Relacionales
  // Todos retornan un valor booleano
  /*
     >  Mayor que
     <  Menor que
     >= Mayor o igual que
     <= Menor o igual que
     == Revisa si dos objetos son iguales
     != Revisa si dos objetos son diferentes
  */

  String persona1 = 'JJ';
  String persona2 = 'Casa';

  // print( persona1 == persona2 );
  // print( persona1 != persona2 );


  int x = 20;
  int y = 30;

  // print( x > y ); // false
  // print( x < y ); // true
  // print( x >= y ); // false
  // print( x <= y ); // true

  // Operador de tipo
  int i = 10;
  String j = '10';

  print( i is int );
  print( j is! int );


}

/////////////////////////////

import 'dart:io';

main() {

  // imprimir en terminal o cmd
  stdout.writeln('¿Cuál es tu nombre?');

  // Leer información
  String nombre = stdin.readLineSync(); // '10'

  stdout.writeln('Tu nombre es: $nombre');

  
}

/////////////////////////////////

import 'dart:io';

main() {

  stdout.writeln('¿Cuál es tu edad?');
  int edad = int.parse( stdin.readLineSync() );

  // if ( edad >= 18  ) {
  //   stdout.writeln('Eres mayor de edad (estas viejo)');
  // } else {
  //   stdout.writeln('Eres menor de edad');
  // }

  /*
    Crear un programa en dart que:
      Si eres mayor o igual a 21 años, mostrar la palabra "ciudadano"
      Si estás entre 18 y 20 (incluyendo 18), mostrar "Mayor de edad"
      Si eres menor a 18 (sin contar 18), mostrar "menor de edad"
      28 ciudadano
      21 ciudadano
      20 mayor de edad
      18 mayor de edad
      17 menor de edad
  */

  if ( edad >= 21 ) {
    stdout.writeln('Ciudano');
  } else if( edad >= 18 ) {
    stdout.writeln('Mayor de edad');
  } else {
    stdout.writeln('Menor de edad');
  }

}

//////////////////////////

import 'dart:io';

main() {

  // for( int i = 1; i <= 10; i++ ) {
  //   print('index i:  ${  2 * 10  }');
  // }

  /*
    Dato de entrada: La base de la tabla de multiplicar
    (este dato debe de ser capturado por el usuario)
    ej: 2      2, 4, 6, 8, 10
    La salida esperada sería
    2 * 1 = 2
    2 * 2 = 4
    2 * 3 = 6
    ..
    2 * 10 = 20
  */

  stdout.writeln('¿Cuál es la base de la tabla?');
  int base = int.parse( stdin.readLineSync() );

  for (int i = 1; i <= 10; i++) {
    stdout.writeln('$base * $i = ${ i * base }');
  }


}

////////////////////////////
main() {

  List<String> listado = ['Batman', 'Superman', 'Mujer Maravilla'];

  // for (int i = 0; i < listado.length; i++) {
  //   print( listado[i] );
  // }

  for (String nombre in listado) {
    print( nombre );
  }

}

////////////////////////////////

import 'dart:io';

main() {

  String continuar = 'y';
  int contador = 0;

  while ( continuar == 'y' ) {

    contador++;
    stdout.writeln('Contador: $contador');

    stdout.writeln('desea continuar? (y/n)');
    continuar = stdin.readLineSync();
    

  }

  // 

}

/////////////////////////

import 'dart:io';

main() {

  String continuar = 'y';
  int contador = 0;

  do {

    contador++;
    stdout.writeln('Contador: $contador');

    stdout.writeln('desea continuar? (y/n)');
    continuar = stdin.readLineSync();
    

  } while ( continuar == 'y' );

}

////////////////////

main() {


  for (int i = 0; i < 10; i++) {
    
    if ( i == 5 ) {
      continue;
    }

    print(i);

    if ( i == 2 ) {
      break;
    }

  }

  //
  //

}

///////////////////////////////

main() {

  outerLoop:
  for (int i = 0; i < 5; i++) {

    print('Valor de i: $i');

    innerLoop:
    for (int j = 0; j < 5; j++) {
      
      print('Valor de j: $j');

      if( j == 2 ) {
        break outerLoop;
      }

    }



  }
 
}

//////////////////////////
import 'dart:math';


main() {


  int rnd = Random().nextInt(7);

  // if ( rnd == 0 ) {
  //   print('Lunes');
  // } else if ( rnd == 1 ) {
  //   print('Martes');
  // } else if ( rnd == 2 ) {
  //   print('Miércoles');
  // } else if ( rnd == 3 ) {
  //   print('Jueves');
  // } else {
  //   print('No es un día de la semana');
  // }
  
  rnd = 10;

  print(rnd);
  switch ( rnd ) { // 0,1,2,3,4,5,6, 'fernando', juan, pedro

    case 0:
      print('Lunes');
    break;

    case 1:
      print('Martes');
    break;

    case 2:
      print('Miércoles');
    break;

    case 3:
      print('Jueves');
    break;

    case 4:
      print('Viernes');
    break;

    case 5:
      print('Sábado');
    break;

    case 6:
      print('Domingo');
    break;


    default: 
      print('No es un día de la semana');

  }



}
