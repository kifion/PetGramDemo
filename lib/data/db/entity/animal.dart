import 'package:floor/floor.dart';

@Entity()
class Animal {
  @PrimaryKey()
  final int id;
  final String url;

  Animal(this.id, this.url);
}
