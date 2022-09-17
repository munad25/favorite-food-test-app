import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db_services.g.dart';

class FavoriteMeal extends Table {
  TextColumn get idMeal => text().named('id_meal')();
  TextColumn get strMeal => text().named('str_meal')();
  TextColumn get strDrinkAlternate => text().named('str_drink_alternate')();
  TextColumn get strCategory => text().named('str_category')();
  TextColumn get strArea => text().named('str_area')();
  TextColumn get strInstructions => text().named('str_instructions')();
  TextColumn get strMealThumb => text().named('str_meal_thumb')();
}


@DriftDatabase(tables: [FavoriteMeal])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fav_meal.sqlite'));
    return NativeDatabase(file);
  });
}