import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:department_store_assignment/domain/entities/product_model.dart';
import 'package:equatable/equatable.dart';

enum DepartmentStoreStatus {
  initialState,
  loadingState,

  //Get department store states
  getDepartmentStoreSuccessState,
  getDepartmentStoreEmptyState,
  getDepartmentStoreError,

  //Get product states
  getProductSuccessState,
  getProductEmptyState,
  getProductError,
}

class DepartmentStoreState extends Equatable {
  final DepartmentStoreStatus status;
  final List<DepartmentStoreModel> departmentStoreList;
  final List<ProductModel> productList;
  final DepartmentStoreModel departmentSelected;

  const DepartmentStoreState({
    this.status = DepartmentStoreStatus.initialState,
    this.departmentStoreList = const [],
    this.productList = const [],
    this.departmentSelected =
        const DepartmentStoreModel(id: '', name: '', imageUrl: ''),
  });

  DepartmentStoreState copyWith({
    DepartmentStoreStatus? status,
    List<DepartmentStoreModel>? departmentStoreList,
    List<ProductModel>? productList,
    DepartmentStoreModel? departmentSelected,
  }) =>
      DepartmentStoreState(
        status: status ?? this.status,
        departmentStoreList: departmentStoreList ?? this.departmentStoreList,
        productList: productList ?? this.productList,
        departmentSelected: departmentSelected ?? this.departmentSelected,
      );

  @override
  List<Object?> get props => [
        status,
        departmentStoreList,
        productList,
      ];
}
