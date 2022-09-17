part of 'meal_detail_bloc.dart';

@immutable
abstract class MealDetailEvent {}

class GetMealEvent implements MealDetailEvent {
  final String id;
  GetMealEvent(this.id);
}
