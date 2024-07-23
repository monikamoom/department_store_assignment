// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_departments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDepartmentsResponse _$GetDepartmentsResponseFromJson(
        Map<String, dynamic> json) =>
    GetDepartmentsResponse(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$GetDepartmentsResponseToJson(
        GetDepartmentsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };
