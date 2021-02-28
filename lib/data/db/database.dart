import 'dart:async';
import 'package:floor/floor.dart';
import 'package:petgram/data/db/dao/animal_dao.dart';
import 'package:petgram/data/db/entity/animal.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Animal])
abstract class AppDatabase extends FloorDatabase {
  AnimalDao get animalDao;
}