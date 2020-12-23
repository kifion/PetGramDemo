import 'package:json_annotation/json_annotation.dart';

import 'bread_list_data.dart';

part 'bread_list_response.g.dart';

@JsonSerializable()
class BreadListResponse {
  BreadListData message;
  String status;

  BreadListResponse({this.message, this.status});

  factory BreadListResponse.fromJson(Map<String, dynamic> json) =>
      _$BreadListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreadListResponseToJson(this);
}
