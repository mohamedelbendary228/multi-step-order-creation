import 'package:baridx_order_creation/features/order_steps_flow/data/datasource/order_steps_datasource.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void setupLocator() {
  //* bloc
  // serviceLocator.registerFactory(() => WeatherBloc(serviceLocator()));

  //* usecase
  // serviceLocator
  //     .registerLazySingleton(() => GetCurrentWeatherUseCase(weatherRepository: serviceLocator()));

  //* repository
  // serviceLocator.registerLazySingleton<WeatherRepository>(
  //   () => WeatherRepositoryImpl(serviceLocator()),
  // );

  //* data source
  serviceLocator.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(),
  );
}
