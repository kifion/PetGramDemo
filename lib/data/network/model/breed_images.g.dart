// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImagesResponse _$BreedImagesResponseFromJson(Map<String, dynamic> json) {
  return BreedImagesResponse(
    message: (json['message'] as List)?.map((e) => e as String)?.toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$BreedImagesResponseToJson(
        BreedImagesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
