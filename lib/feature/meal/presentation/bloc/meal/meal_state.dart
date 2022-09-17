part of 'meal_bloc.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class MealLoaded extends MealState {
  final List<Meal> meals;

  MealLoaded(this.meals);
}

class MealError extends MealState {}