import 'package:department_store_assignment/data/mappers/department_store_mapper.dart';
import 'package:department_store_assignment/data/network/rest_client/department_store_rest_client.dart';
import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:department_store_assignment/domain/entities/product_model.dart';
import 'package:department_store_assignment/domain/repositories/department_store_repository.dart';
import 'package:flutter/material.dart';

class DepartmentStoreRepositoryImpl implements DepartmentStoreRepository {
  final DepartmentStoreRestClient _client;

  DepartmentStoreRepositoryImpl({required DepartmentStoreRestClient client})
      : _client = client;

  @override
  Future<List<DepartmentStoreModel>> getDepartmentStores() async {
    final response = await _client.getDepartments();
    return response.map((e) => e.toDepartmentStore()).toList();
  }

  @override
  Future<List<ProductModel>> getProductList(String id) async {
    final response = await _client.getProductsByDepartmentId(id);
    return response.map((e) => e.toProductModel()).toList();
  }
}
