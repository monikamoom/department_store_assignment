import 'package:json_annotation/json_annotation.dart';

part 'get_departments_products_response.g.dart';

@JsonSerializable()
class GetDepartmentsProductsResponse {
  final String? name;
  final String? imageUrl;
  final String? desc;
  final String? price;
  final String? type;
  final String? id;
  final String? departmentId;

  GetDepartmentsProductsResponse({
    this.name,
    this.imageUrl,
    this.desc,
    this.price,
    this.type,
    this.id,
    this.departmentId,
  });

  factory GetDepartmentsProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDepartmentsProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDepartmentsProductsResponseToJson(this);
}
