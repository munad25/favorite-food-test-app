import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/error/failure.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';

abstract class MealRepository {
  Future<Either<Failure, List<Meal>>> getMealList(String search);
}