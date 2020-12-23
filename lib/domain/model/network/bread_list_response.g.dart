// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bread_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreadListResponse _$BreadListResponseFromJson(Map<String, dynamic> json) {
  return BreadListResponse(
    message: json['message'] == null
        ? null
        : BreadListData.fromJson(json['message'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$BreadListResponseToJson(BreadListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
