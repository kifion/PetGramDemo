import 'package:moor_flutter/moor_flutter.dart';

import 'model/breed.dart';

part 'database.g.dart';

@UseMoor(tables: [Breed])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  ));

  int get schemaVersion => 1;

  Future<List<BreedData>> getAllBreeds() => select(breed).get();
  Future insertTask(BreedData breedData) => into(breed).insert(breedData);
}