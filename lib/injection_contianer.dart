import 'package:baridx_order_creation/features/home/data/datasource/home_local_datasource.dart';
import 'package:baridx_order_creation/features/home/data/respository/home_repository_impl.dart';
import 'package:baridx_order_creation/features/home/domain/respository/home_respository.dart';
import 'package:baridx_order_creation/features/home/domain/uscase/get_orders_usecase.dart';
import 'package:baridx_order_creation/features/home/presentation/cubit/home_cubit.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/datasource/order_steps_datasource.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/respository/order_steps_repository_impl.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/repository/order_steps_repository.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/usecase/create_order_usecase.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final serviceLocator = GetIt.instance;
Future<void> setupLocator() async {
  //* hive
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  serviceLocator.registerLazySingleton(() => Hive.box(name: 'orders'));

  _setupOrderStepsFlow();
  _setUpHome();
}

void _setupOrderStepsFlow() {
//* cubit
  serviceLocator.registerFactory(() => OrderStepsCubit(serviceLocator()));

  //* usecase
  serviceLocator
      .registerLazySingleton(() => CreateOrderUseCase(orderStepsRepository: serviceLocator()));

  //* repository
  serviceLocator.registerLazySingleton<OrderStepsRepository>(
    () => OrderStepsRepositoryImpl(orderRemoteDataSource: serviceLocator()),
  );

  //* data source
  serviceLocator.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(box: serviceLocator()),
  );
}

void _setUpHome() {
  //* cubit
  serviceLocator.registerFactory(() => HomeCubit(serviceLocator()));

  //* usecase
  serviceLocator.registerLazySingleton(() => GetOrdersUseCase(homeRepository: serviceLocator()));

  //* repository
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeLocalDataSource: serviceLocator()),
  );

  //* data source
  serviceLocator.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(box: serviceLocator()),
  );
}
