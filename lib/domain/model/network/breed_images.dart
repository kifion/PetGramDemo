import 'package:json_annotation/json_annotation.dart';

part 'breed_images.g.dart';

@JsonSerializable()
class BreedImagesResponse {
  List<String> message;
  String status;

  BreedImagesResponse({this.message, this.status});

  factory BreedImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedImagesResponseToJson(this);
}
