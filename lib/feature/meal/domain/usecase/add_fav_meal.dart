import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/repository/fav_repository.dart';

class AddFavMeal implements Usecase<bool, Meal> {
  final FavRepository _repository;

  const AddFavMeal(this._repository);
  
  @override
  Future<Either<Failure, bool>> call(Meal params) {
    return _repository.addfavorite(params);
  }

}