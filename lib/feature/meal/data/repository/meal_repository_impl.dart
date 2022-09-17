import 'package:dio/dio.dart';
import 'package:favorite_meal/feature/meal/data/datasource/meal_network_services.dart';
import 'package:favorite_meal/feature/meal/data/maper/meal_maper.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:favorite_meal/feature/meal/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealNetworkServices _services;

  const MealRepositoryImpl(this._services);

  @override
  Future<Either<Failure, List<Meal>>> getMealList(String search) async {
    try {
      final response = await _services.getMealList(search);
      final List rawList = response.data['meals'] ?? [];
      return Right(
        rawList.map((e) => MealMaper.fromJson(e)).toList(),
      );
    } on DioError catch (err) {
      return const Left(
        Failure(
          code: 'KJ8SDT',
          message: 'Geting data failed',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Meal>> getMealById(String id) async {
    try {
      final response = await _services.getMealSingle(id);
      final Map<String, dynamic>? rawData = response.data['meals']?[0] ?? null;

      if (rawData == null) {
        return const Left(
          Failure(
            code: 'DJKW7I',
            message: 'Data not founf',
          ),
        );
      }

      return Right(
        MealMaper.fromJson(rawData),
      );

    } on DioError catch (err) {
      return const Left(
        Failure(
          code: 'KJ8SDT',
          message: 'Geting data failed',
        ),
      );
    }
  }
}
