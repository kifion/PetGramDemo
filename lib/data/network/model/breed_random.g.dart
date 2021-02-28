// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_random.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedRandomResponse _$BreedRandomResponseFromJson(Map<String, dynamic> json) {
  return BreedRandomResponse(
    message: json['message'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$BreedRandomResponseToJson(
        BreedRandomResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
