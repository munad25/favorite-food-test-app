import 'package:bloc/bloc.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_meal_network.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final _getMealNetwork = Modular.get<GetMealNetwork>();
  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) async {
      if (event is GetMealList) {
        emit(await _fetchData(null));
      }

      if(event is SearchMeal) {
        emit(await _fetchData(event.search));
      }
    });
  }

  Future<MealState> _fetchData(String? search) async {
    final result = await _getMealNetwork(search ?? '');
    late MealState state;
    result.fold(
      (l) {
        state = MealError();
      },
      (r) {
        state = MealLoaded(r);
      },
    );

    return state;
  }
}
