import 'package:bloc_test/bloc_test.dart';
import 'package:department_store_assignment/domain/entities/department_store_model.dart';
import 'package:department_store_assignment/domain/repositories/department_store_repository.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_bloc.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_event.dart';
import 'package:department_store_assignment/presentation/bloc/department_store_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDepartmentStoreRepository extends Mock
    implements DepartmentStoreRepository {}

void main() {
  late final MockDepartmentStoreRepository mockDepartmentStoreRepository;

  setUpAll(() {
    mockDepartmentStoreRepository = MockDepartmentStoreRepository();
  });

  blocTest(
    'Given landing to department store, '
    'When GetDepartmentStoreEvent, '
    'Then update status to getDepartmentStoreSuccessState',
    build: () {
      when(() => mockDepartmentStoreRepository.getDepartmentStores())
          .thenAnswer(
        (_) async => [
          const DepartmentStoreModel(
              id: 'id', name: 'name', imageUrl: 'imageUrl')
        ],
      );
      return DepartmentStoreBloc(
        mockDepartmentStoreRepository,
      );
    },
    act: (bloc) => bloc.add(
      GetDepartmentStoreEvent(),
    ),
    expect: () => [
      const DepartmentStoreState(
        status: DepartmentStoreStatus.loadingState,
      ),
      const DepartmentStoreState(
        status: DepartmentStoreStatus.getDepartmentStoreSuccessState,
        departmentStoreList: [
          DepartmentStoreModel(id: 'id', name: 'name', imageUrl: 'imageUrl')
        ],
      ),
    ],
  );
}
