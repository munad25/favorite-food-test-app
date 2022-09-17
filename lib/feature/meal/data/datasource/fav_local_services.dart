import 'package:favorite_meal/core/services/db_services.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';

abstract class FavLocalServices {
  factory FavLocalServices(LocalDatabase db) = _FavLocalServices;

  Future<void> addFavorite(Meal meal);
  Future<int> deleteFav(String id);
  Future<List<Map<String, dynamic>>> getAllFavorite();
}

class _FavLocalServices implements FavLocalServices {
  final LocalDatabase _db;

  const _FavLocalServices(this._db);

  @override
  Future<void> addFavorite(Meal meal) async {
    await _db.into(_db.favoriteMeal).insert(
          FavoriteMealCompanion.insert(
            idMeal: meal.idMeal ?? '1',
            strMeal: meal.strMeal ?? '',
            strDrinkAlternate: meal.strDrinkAlternate ?? '',
            strCategory: meal.strCategory ?? '',
            strArea: meal.strArea ?? '',
            strInstructions: meal.strInstructions ?? '',
            strMealThumb: meal.strMealThumb ?? '',
          ),
        );
  }

  @override
  Future<List<Map<String, dynamic>>> getAllFavorite() async {
    final fav = await _db.select(_db.favoriteMeal).get();
    return fav.map((e) => e.toJson()).toList(); 
  }

  @override
  Future<int> deleteFav(String id) async {
    return await (_db.delete(_db.favoriteMeal)..where((tbl) => tbl.idMeal.equals(id))).go();
  }
}
