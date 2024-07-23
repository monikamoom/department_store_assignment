import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:department_store_assignment/domain/entities/product_model.dart';

abstract class DepartmentStoreRepository {
  Future<List<DepartmentStoreModel>> getDepartmentStores();

  Future<List<ProductModel>> getProductList(String id);
}
