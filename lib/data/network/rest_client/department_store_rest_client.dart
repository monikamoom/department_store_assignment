import 'package:department_store_assignment/data/dtos/response/get_departments_products_response.dart';
import 'package:department_store_assignment/data/dtos/response/get_departments_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'department_store_rest_client.g.dart';

@RestApi()
abstract class DepartmentStoreRestClient {
  factory DepartmentStoreRestClient(Dio dio) = _DepartmentStoreRestClient;

  @GET('/api/v1/departments')
  Future<List<GetDepartmentsResponse>> getDepartments();

  @GET('/api/v1/departments/{departmentId}/products')
  Future<List<GetDepartmentsProductsResponse>> getProductsByDepartmentId(
    @Path('departmentId') String id,
  );
}
