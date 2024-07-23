// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_departments_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDepartmentsProductsResponse _$GetDepartmentsProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetDepartmentsProductsResponse(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      desc: json['desc'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
      departmentId: json['departmentId'] as String?,
    );

Map<String, dynamic> _$GetDepartmentsProductsResponseToJson(
        GetDepartmentsProductsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'desc': instance.desc,
      'price': instance.price,
      'type': instance.type,
      'id': instance.id,
      'departmentId': instance.departmentId,
    };
