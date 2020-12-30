import 'package:json_annotation/json_annotation.dart';

part 'breed_random.g.dart';

@JsonSerializable()
class BreedRandomResponse {
  String message;
  String status;

  BreedRandomResponse({this.message, this.status});

  factory BreedRandomResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedRandomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedRandomResponseToJson(this);
}
