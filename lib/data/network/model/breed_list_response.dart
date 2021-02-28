import 'package:json_annotation/json_annotation.dart';

part 'breed_list_response.g.dart';

@JsonSerializable()
class BreedListResponse {
  BreedListData message;
  String status;

  BreedListResponse({this.message, this.status});

  factory BreedListResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedListResponseToJson(this);
}

class BreedListData {
  List<BreedModel> list;

  BreedListData(this.list);

  factory BreedListData.fromJson(Map<String, List<String>> json) {
    var list = List<BreedModel>();
    json.forEach((key, value) {
      list.add(BreedModel(key, value));
    });
    return BreedListData(list);
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    this.list.forEach((element) {
      map[element.name] = element.subBreeds;
    });
    return map;
  }
}

class BreedModel {
  final String name;
  final List<String> subBreeds;

  BreedModel(this.name, this.subBreeds);
}