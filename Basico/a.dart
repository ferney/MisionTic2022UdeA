void main() {
  
  // Este es un comentario
  
  /*
   *  Esto es un comentario multilinea
   *  Hola de nuevo...
   */
  
  
  print('Hola Mundo');
  
}
//////////////////////////////////////////////////
void main()  {
  
  // Strings 
  final String nombre = 'Tony';
  final apellido = 'Stark';
  
//   nombre = 'Peter';
  
  print('$nombre $apellido');
  
  
//   Números
  int empleados = 10;
  double salario = 1856.25;
  
  print( empleados );
  print( salario );
  
}

///////////////////////////////

void main() {
  
  
  bool? isActive = null;
  
  if ( isActive == null ) {
    print( 'isActive es null' );
  } else {
    print( 'No es null' );
  }
  
  
}

////////////////////////////////////////
void main() {
  // Tipo de datos de literales
  print(null.runtimeType);
  print('Hola'.runtimeType);
  print(1.runtimeType);
  print(true.runtimeType);
  print(2.5.runtimeType);

  // Var, dynamic y Object
  var variable;                 // Si no se inicializa, es dynamic
  var variableEntera = 6;       // Es de tipo int, no dynamic
  dynamic dinamico;
  Object objeto = Object();

  print('\nAntes de asignar');
  print('var sin asignar: ${variable.runtimeType}');
  print('var asignado: ${variableEntera.runtimeType}');
  print('dynamic: ${dinamico.runtimeType}');
  print('object: ${objeto.runtimeType}');
  
  variable = 'Hola';
  dinamico = 2;
  objeto = 5.3;
  
  print('\nDespués de asignar:');
  print('var sin asignar: ${variable.runtimeType}');
  print('dynamic: ${dinamico.runtimeType}');
  print('object: ${objeto.runtimeType}');
  
  variable = 3;
  dinamico = 'Ahora soy String';
  objeto = 'También soy String';
  
  print('\nDespués de reasignar:');
  print('var asignado: ${variable.runtimeType}');
  print('dynamic: ${dinamico.runtimeType}');
  print('object: ${objeto.runtimeType}');
  
  // Un int no puede ser String, da error
  // Descomentar la línea 41 para ver el error
  //variableEntera = 'Soy inevitable';
}
///////////////////////////////////////////

import 'dart:io';

void main() {
  print('a) Saludar a un perro');
  print('b) Saludar a un gato');
  print('c) Saludar a un perro con bata');
  print('d) Saludar a un gato con traje');
  print('Ingrese una opción: ');

  String line = stdin.readLineSync();
  
  if (line == 'a') {
    print('Perro dice: Guau guau');
  } else if (line == 'b') {
    print('Gato dice: Miau');
  } else if (line == 'c') {
    print('Dogtor: ¿Tiene cita?');
  } else if (line == 'd') {
    print('Businesscat dice: Que te atienda Miauricio');
  } else {
    print('Esto sí es gracioso');
  }
}

///////////////////////////////////

import 'dart:io';

void main() {
	do {
    print('a) Saludar a un perro');
    print('b) Saludar a un gato');
    print('c) Saludar a un perro con bata');
    print('d) Saludar a un gato con traje');
    print('Ingrese una opción: ');

    String line = stdin.readLineSync();
    
    if (line == 'z') {
      print('Hasta la vista, baby');
      break;
    } else if (line == 'a') {
      print('Perro dice: Guau guau');
    } else if (line == 'b') {
      print('Gato dice: Miau');
    } else if (line == 'c') {
      print('Dogtor: ¿Tiene cita?');
    } else if (line == 'd') {
      print('Businesscat dice: Que te atienda Miauricio');
    } else {
      print('Eso no es gracioso');
    }

    print(''); // Para que no esté pegado el menú
  } while (true);
}

////////////////////////////

void main() {
	dynamic d = 123; //'123';

  if (d == 123) print('Es 123');
  if (d == '123') print('Es "123" como String');
  if (d == true) print('Es true');
  if (d == 2.5) print('Es 2.5');
  if (d == null) print('Es null');

  if (d is int) print('Es int'); 
  if (d is String) print('Es String');
  if (d is bool) print('Es bool'); 
  if (d is double) print('Es double');

  // Estamos preguntando por un tipo específico
  // Comenta la línea 17 para ver qué resultado da
  if (d.length > 1) print('Panik');

  // Esta forma es mucho mejor: antes nos aseguramos que es String
  // Si la primera da false, la segunda no se evalúa
  if (d is String && d.length > 1) print('Kalm');

  // Si la primera da true, la segunda no se evalúa
  if (d != null || d.length > 1) print('Panik');
}

/////////////////////////////////

import 'dart:io';

void main() {
	ciclo: do {
    print('a) Saludar a un perro');
    print('b) Saludar a un gato');
    print('c) Saludar a un perro con bata');
    print('d) Saludar a un gato con traje');
    print('Ingrese una opción: ');

    String line = stdin.readLineSync();

    switch (line) {
      case 'z':
        print('Hasta la vista, baby');
        break ciclo;
      
      case 'a':
        print('Perro dice: Guau guau');
        break;

      case 'b':
        print('Gato dice: Miau');
        break;

      case 'c':
        print('Dogtor: ¿Tiene cita?');
        break;

      case 'd':
        print('Businesscat dice: Que te atienda Miauricio');
        break;

      default:
        print('Eso no es gracioso');
    }

    print(''); // Para que no esté pegado el menú
  } while (true);
}

//////////////////////////////////////

import 'dart:io';

int a = 0, b = 0;
String opcion = '';

void menu(){
  print('Seleccione una opcion');
  print('a) Asignar valores');
  print('b) Sumar valores');
  print('c) Asignar valores');
  print('d) Multiplicar valores');
  print('e) Dividir (entera) valores');
  print('f) Dividir (decimal) valores');
  print('g) Módulo de los valores');
  print('z) Salir');
}

void asignarValores() {
  String e1 = stdin.readLineSync()!;
  String e2 = stdin.readLineSync()!;

  a = int.parse(e1);
  b = int.parse(e2);
}

void sumarValores() {
  int suma = a + b;
  print(suma);
}

void restarValores() {
  int resta = a - b;
  print(resta);
}

void multiplicarValores() {
  int multiplicacion = a * b;
  print(multiplicacion);
}

void divisionEnteraValores() {
  int division = a ~/ b;
  print(division);
}

void divisionValores() {
  double division = a / b;
  print(division);
}

void moduloValores() {
  int modulo = a % b;
  print(modulo);
}

void main() {
  loop: while (true) {
    menu();
    opcion = stdin.readLineSync()!;

    switch (opcion) {
      case 'a':
        asignarValores();
        break;
      
      case 'b':
        sumarValores();
        break;
      
      case 'c':
        restarValores();
        break;
      
      case 'd':
        multiplicarValores();
        break;

      case 'e':
        divisionEnteraValores();
        break;

      case 'f':
        divisionValores();
        break;

      case 'g':
        moduloValores();
        break;
      
      case 'z':
        break loop;
    }

    print('');
  }
}

////////////////////////////////////////////////
