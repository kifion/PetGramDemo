// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedListResponse _$BreedListResponseFromJson(Map<String, dynamic> json) {
  return BreedListResponse(
    message: json['message'] == null
        ? null
        : BreedListData.fromJson((json['message'] as Map<String, dynamic>)?.map(
            (k, e) =>
                MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
          )),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$BreedListResponseToJson(BreedListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
