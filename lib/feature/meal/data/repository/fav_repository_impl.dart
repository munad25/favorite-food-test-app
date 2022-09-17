import 'package:favorite_meal/feature/meal/data/datasource/fav_local_services.dart';
import 'package:favorite_meal/feature/meal/data/maper/meal_maper.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/feature/meal/domain/repository/fav_repository.dart';

class FavRepositoryImpl implements FavRepository {
  final FavLocalServices _services;

  const FavRepositoryImpl(this._services);

  @override
  Future<Either<Failure, bool>> addfavorite(Meal meal) async {
    try {
      await _services.addFavorite(meal);
      return const Right(true);
    } catch (err) {
      print(err);
      return const Left(
        Failure(
          code: 'JSD7WE1D',
          message: 'add favorite failed',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> getAllFavorite() async {
    try {
      final response = await _services.getAllFavorite();

      return Right(
        response.map((e) => MealMaper.fromJson(e)).toList(),
      );
    } catch (err) {
      return const Left(
        Failure(
          code: 'REKJS21D',
          message: 'Getting data failed',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> deleteFavorite(String id) async {
    try {
      final response = await _services.deleteFav(id);
      return Right(response);
    } catch (err) {
      return const Left(
        Failure(
          code: 'SD5S2T1D',
          message: 'Delete data failed',
        ),
      );
    }
  }
}
