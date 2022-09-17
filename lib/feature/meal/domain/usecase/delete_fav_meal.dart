import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/repository/fav_repository.dart';

class DeleteFavMeal implements Usecase<int, String> {
  final FavRepository _repository;

  const DeleteFavMeal(this._repository);
  
  @override
  Future<Either<Failure, int>> call(String params) {
    return _repository.deleteFavorite(params);
  }

}