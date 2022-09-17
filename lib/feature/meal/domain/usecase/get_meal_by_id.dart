import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';

class GetMealById implements Usecase<Meal, String> {
  final MealRepository _repository;

  const GetMealById(this._repository);
  
  @override
  Future<Either<Failure, Meal>> call(String params) {
    return _repository.getMealById(params);
  }

}