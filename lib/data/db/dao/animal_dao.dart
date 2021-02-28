import 'package:floor/floor.dart';
import 'package:petgram/data/db/entity/animal.dart';

@dao
abstract class AnimalDao {
  @Insert()
  Future<int> insertMeasure(Animal person);
}