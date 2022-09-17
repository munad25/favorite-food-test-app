import 'package:bloc/bloc.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_meal_by_id.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'meal_detail_event.dart';
part 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final _getMealById = Modular.get<GetMealById>();

  MealDetailBloc() : super(MealDetailInitial()) {
    on<MealDetailEvent>((event, emit) async {
      print(event);
      
      if (event is GetMealEvent) {
        emit(await _fetchData(event.id));
      }
    });
  }

  Future<MealDetailState> _fetchData(String id) async {
    late MealDetailState state;

    final result = await _getMealById(id);

    result.fold(
      (l) {
        print(l.code);
        state = MealDetailError();
      },
      (r) {
        print(r);
        state = MealDetailLoaded(r);
      },
    );

    return state;
  }
}
