import 'package:department_store_assignment/data/dtos/response/get_departments_products_response.dart';
import 'package:department_store_assignment/data/dtos/response/get_departments_response.dart';
import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:department_store_assignment/domain/entities/product_model.dart';

extension DepartmentStoreExtension on GetDepartmentsResponse {
  DepartmentStoreModel toDepartmentStore() {
    return DepartmentStoreModel(
      name: name ?? '',
      imageUrl: imageUrl ?? '',
      id: id ?? '',
    );
  }
}

extension ProductListExtension on GetDepartmentsProductsResponse {
  ProductModel toProductModel() {
    return ProductModel(
      name: name ?? '',
      imageUrl: imageUrl ?? '',
      desc: desc ?? '',
      price: price ?? '',
      type: type ?? '',
      id: id ?? '',
      departmentId: departmentId ?? '',
    );
  }
}
