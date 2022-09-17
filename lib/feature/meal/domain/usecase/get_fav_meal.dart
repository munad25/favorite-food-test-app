import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/repository/fav_repository.dart';

class GetFavMeal implements Usecase<List<Meal>, NoParams> {
  final FavRepository _repository;

  const GetFavMeal(this._repository);
  
  @override
  Future<Either<Failure, List<Meal>>> call(NoParams params) {
    return _repository.getAllFavorite();
  }

}