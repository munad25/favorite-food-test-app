part of 'meal_detail_bloc.dart';

@immutable
abstract class MealDetailState {}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final Meal meal;
  MealDetailLoaded(this.meal);
}

class MealDetailError extends MealDetailState{}
