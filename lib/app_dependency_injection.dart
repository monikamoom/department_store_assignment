import 'package:department_store_assignment/data/network/dio_factory.dart';
import 'package:department_store_assignment/data/network/rest_client/department_store_rest_client.dart';
import 'package:department_store_assignment/data/repositories/department_store_repository_impl.dart';
import 'package:department_store_assignment/domain/repositories/department_store_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.I;

class AppDependencyInjection {
  Future<void> init() async {
    _registerNetworkDependency();
    _registerApiClient();
    _registerRepository();
  }

  void _registerNetworkDependency() {
    injector.registerLazySingleton<Dio>(() => DioFactory.createDio());
  }

  void _registerApiClient() {
    injector.registerLazySingleton<DepartmentStoreRestClient>(
      () => DepartmentStoreRestClient(injector.get<Dio>()),
    );
  }

  void _registerRepository() {
    injector.registerLazySingleton<DepartmentStoreRepository>(
      () => DepartmentStoreRepositoryImpl(
        client: injector.get<DepartmentStoreRestClient>(),
      ),
    );
  }
}
