import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/error/failure.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';

abstract class FavRepository {
  Future<Either<Failure, bool>> addfavorite(Meal meal);
  Future<Either<Failure, int>> deleteFavorite(String id);
  Future<Either<Failure, List<Meal>>> getAllFavorite();
}