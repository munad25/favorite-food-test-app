import 'package:dio/dio.dart';
import 'package:favorite_meal/config/router/app_route.dart';
import 'package:favorite_meal/core/services/db_services.dart';
import 'package:favorite_meal/core/services/dio_services.dart';
import 'package:favorite_meal/feature/meal/data/datasource/fav_local_services.dart';
import 'package:favorite_meal/feature/meal/data/datasource/meal_network_services.dart';
import 'package:favorite_meal/feature/meal/data/repository/fav_repository_impl.dart';
import 'package:favorite_meal/feature/meal/data/repository/meal_repository_impl.dart';
import 'package:favorite_meal/feature/meal/domain/repository/fav_repository.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/add_fav_meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/delete_fav_meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_fav_meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_meal_by_id.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_meal_network.dart';
import 'package:favorite_meal/feature/meal/presentation/view/favorite_view.dart';
import 'package:favorite_meal/feature/meal/presentation/view/meal_detail_view.dart';
import 'package:favorite_meal/feature/meal/presentation/view/meal_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  final initialRoutes = AppRoute.HOME;

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<Dio>(
          (i) => dioServices(),
        ),
        Bind.lazySingleton<LocalDatabase>(
          (i) => LocalDatabase(),
        ),
        Bind.lazySingleton<MealNetworkServices>(
          (i) => MealNetworkServices(
            i(),
          ),
        ),
        Bind.lazySingleton<MealRepository>(
          (i) => MealRepositoryImpl(
            i(),
          ),
        ),
        Bind.lazySingleton<GetMealNetwork>(
          (i) => GetMealNetwork(
            i(),
          ),
        ),
        Bind.lazySingleton<FavLocalServices>(
          (i) => FavLocalServices(
            i(),
          ),
        ),
        Bind.lazySingleton<FavRepository>(
          (i) => FavRepositoryImpl(
            i(),
          ),
        ),
        Bind.lazySingleton<AddFavMeal>(
          (i) => AddFavMeal(
            i(),
          ),
        ),
        Bind.lazySingleton<GetFavMeal>(
          (i) => GetFavMeal(
            i(),
          ),
        ),
        Bind.lazySingleton<DeleteFavMeal>(
          (i) => DeleteFavMeal(
            i(),
          ),
        ),
        Bind.lazySingleton<GetMealById>(
          (i) => GetMealById(
            i(),
          ),
        ),
      ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const MealView(),
        ),
        ChildRoute(
          AppRoute.MEAL_DATAIL,
          child: (context, args) => MealDetailView(id: args.params['id']),
        ),
        ChildRoute(
          AppRoute.FAVORITE_PAGE,
          child: (context, args) => FAvoriteView(),
        ),
      ];
}
