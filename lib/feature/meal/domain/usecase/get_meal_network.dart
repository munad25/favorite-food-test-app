import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';

class GetMealNetwork implements Usecase<List<Meal>, String> {
  final MealRepository _repository;

  const GetMealNetwork(this._repository);

  @override
  Future<Either<Failure, List<Meal>>> call(String params) async {
    try {
      return _repository.getMealList(params);
    } catch (err) {
      return const Left(
        Failure(
          code: 'ADW6R4IK',
          message: 'Get data failed'
        ),
      );
    }
  }
}
