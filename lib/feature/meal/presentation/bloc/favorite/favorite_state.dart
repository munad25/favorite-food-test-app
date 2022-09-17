part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<String> favoriteIds;
  FavoriteLoaded(this.favoriteIds);
}

class FavoriteListLoaded extends FavoriteState {
  final List<Meal> favList;
  FavoriteListLoaded(this.favList);
}

class FavoriteError extends FavoriteState {}
