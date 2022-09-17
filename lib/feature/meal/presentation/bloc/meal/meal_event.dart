part of 'meal_bloc.dart';

@immutable
abstract class MealEvent {}

class GetMealList extends  MealEvent {}
class SearchMeal extends MealEvent {
  final String search;
  SearchMeal(this.search);
}