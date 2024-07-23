import 'package:department_store_assignment/domain/repositories/department_store_repository.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_event.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentStoreBloc
    extends Bloc<DepartmentStoreEvent, DepartmentStoreState> {
  final DepartmentStoreRepository _departmentStoreRepository;

  DepartmentStoreBloc(this._departmentStoreRepository)
      : super(const DepartmentStoreState()) {
    on<GetDepartmentStoreEvent>(_getDepartmentStores);
    on<GetProductDetailListEvent>(_getProductList);
  }

  Future<void> _getDepartmentStores(
    GetDepartmentStoreEvent event,
    Emitter<DepartmentStoreState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DepartmentStoreStatus.loadingState));

      final response = await _departmentStoreRepository.getDepartmentStores();
      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            status: DepartmentStoreStatus.getDepartmentStoreSuccessState,
            departmentStoreList: response,
          ),
        );
      } else {
        emit(state.copyWith(
            status: DepartmentStoreStatus.getDepartmentStoreEmptyState));
      }
    } catch (_) {
      emit(state.copyWith(
          status: DepartmentStoreStatus.getDepartmentStoreError));
    }
  }

  Future<void> _getProductList(
    GetProductDetailListEvent event,
    Emitter<DepartmentStoreState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DepartmentStoreStatus.loadingState));

      final response =
          await _departmentStoreRepository.getProductList(event.model.id);
      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            status: DepartmentStoreStatus.getProductSuccessState,
            productList: response,
            departmentSelected: event.model,
          ),
        );
      } else {
        emit(
            state.copyWith(status: DepartmentStoreStatus.getProductEmptyState,
              productList: [],
              departmentSelected: event.model,
            ));
      }
    } catch (_) {
      emit(state.copyWith(
        status: DepartmentStoreStatus.getProductError,
        productList: [],
        departmentSelected: event.model,
      ));
    }
  }
}
