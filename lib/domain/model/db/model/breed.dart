import 'package:moor_flutter/moor_flutter.dart';

class Breed extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}