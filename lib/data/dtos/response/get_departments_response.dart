import 'package:json_annotation/json_annotation.dart';

part 'get_departments_response.g.dart';
//
// @JsonSerializable()
// class GetDepartmentsResponse {
//   final List<Department>? departments;
//
//   GetDepartmentsResponse({
//     this.departments,
//   });
//
//   factory GetDepartmentsResponse.fromJson(Map<String, dynamic> json) =>
//       _$GetDepartmentsResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GetDepartmentsResponseToJson(this);
// }
//
@JsonSerializable()
class GetDepartmentsResponse {
  final String? name;
  final String? imageUrl;
  final String? id;

  GetDepartmentsResponse({
    this.name,
    this.imageUrl,
    this.id,
  });

  factory GetDepartmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDepartmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDepartmentsResponseToJson(this);
}

