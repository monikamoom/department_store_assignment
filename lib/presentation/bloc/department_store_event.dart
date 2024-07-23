import 'package:department_store_assignment/domain/entities/department_store_model.dart';

sealed class DepartmentStoreEvent {
  const DepartmentStoreEvent();
}

class GetDepartmentStoreEvent extends DepartmentStoreEvent {
  GetDepartmentStoreEvent();
}

class GetProductDetailListEvent extends DepartmentStoreEvent {
  final DepartmentStoreModel model;

  GetProductDetailListEvent({required this.model});
}
