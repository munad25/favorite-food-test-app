import 'package:dio/dio.dart';
import 'package:favorite_meal/core/services/dio_services.dart';
import 'package:favorite_meal/feature/meal/data/datasource/meal_network_services.dart';
import 'package:favorite_meal/feature/meal/data/repository/meal_repository_impl.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_meal_network.dart';
import 'package:get_it/get_it.dart';

final injectore = GetIt.I;

Future<void> initializeDependencies() async {
  injectore.registerLazySingleton<Dio>(
    () => dioServices(),
  );

  injectore.registerLazySingleton<MealNetworkServices>(
    () => MealNetworkServices(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<GetMealNetwork>(
    () => GetMealNetwork(
      injectore(),
    ),
  );
}
