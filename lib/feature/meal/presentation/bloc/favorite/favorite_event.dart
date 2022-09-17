part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class AddFavoriteMeal implements FavoriteEvent {
  final Meal meal;
  AddFavoriteMeal(this.meal);
}

class GetAllFavMeal implements FavoriteEvent {}

class GetFavoriteList implements FavoriteEvent {}

class DeleteFavMealEvent implements FavoriteEvent {
  final Meal meal;
  DeleteFavMealEvent(this.meal);
}
