import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  @override
  Future<Either<Failure, List<Meal>>> getMealList(String search) {
    // TODO: implement getMealList
    throw UnimplementedError();
  }

}