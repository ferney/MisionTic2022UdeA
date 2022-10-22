import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'mascota.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE gato(id INTEGER PRIMARY KEY, nombre TEXT, edad INTEGER)',
      );
    },
    version: 1,
  );

//insertar datos
  Future<void> insertGato(Gato gato) async {
    final db = await database;

    await db.insert(
      'gato',
      gato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// extraer datos
  Future<List<Gato>> gato() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('gato');

    return List.generate(maps.length, (i) {
      return Gato(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        edad: maps[i]['edad'],
      );
    });
  }

  // actualizar datos
  Future<void> updateGato(Gato gato) async {
    final db = await database;

    await db.update(
      'gato',
      gato.toMap(),
      where: 'id = ?',
      whereArgs: [gato.id],
    );
  }

  //eliminar datos
  Future<void> deleteGato(int id) async {
    final db = await database;

    await db.delete(
      'gato',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //crear os objetos para instanciar

  var michi = Gato(
    id: 1,
    nombre: 'michi',
    edad: 5,
  );

  await insertGato(michi);
  print(await gato());

  michi = Gato(
    id: michi.id,
    nombre: michi.nombre,
    edad: michi.edad + 4,
  );
  await updateGato(michi);
  print(await gato());

  await deleteGato(michi.id);
  print(await gato());
}

class Gato {
  final int id;
  final String nombre;
  final int edad;

  Gato({
    this.id,
    this.nombre,
    this.edad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
    };
  }

  @override
  String toString() {
    return 'Gato{id: $id, nombre: $nombre, edad: $edad}';
  }
}
