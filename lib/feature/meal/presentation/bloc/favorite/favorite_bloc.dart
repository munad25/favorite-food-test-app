import 'package:bloc/bloc.dart';
import 'package:favorite_meal/core/usecase/usecase.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/add_fav_meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/delete_fav_meal.dart';
import 'package:favorite_meal/feature/meal/domain/usecase/get_fav_meal.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final _addFavMealUsecase = Modular.get<AddFavMeal>();
  final _getAllFavUsecase = Modular.get<GetFavMeal>();
  final _deleteFavUsecase = Modular.get<DeleteFavMeal>();

  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is AddFavoriteMeal) {
        await _addFavMeal(event.meal);
        emit(await _getAllFav());
      }

      if (event is GetAllFavMeal) {
        emit(await _getAllFav());
      }

      if (event is DeleteFavMealEvent) {
        await _deleteFav(event.meal);

        print(state);

        if(state is FavoriteLoaded) {
          emit(await _getAllFav());
        } else {
          emit(await _getFavoriteList());
        }
      }

      if (event is GetFavoriteList) {
        emit(await _getFavoriteList());
      }
    });
  }

  Future<void> _addFavMeal(Meal meal) async {
    final result = await _addFavMealUsecase(meal);

    result.fold((l) => print(l), (r) => print('success'));
  }

  Future<FavoriteState> _getAllFav() async {
    final result = await _getAllFavUsecase(NoParams());

    late FavoriteState state;

    result.fold((l) => state = FavoriteError(), (r) {
      state = FavoriteLoaded(
        r.map((e) => e.idMeal ?? '').toList(),
      );
    });

    return state;
  }

  Future<FavoriteState> _getFavoriteList() async {
    final result = await _getAllFavUsecase(NoParams());

    late FavoriteState state;

    result.fold(
      (l) => state = FavoriteError(),
      (r) {
        state = FavoriteListLoaded(r);
      },
    );

    return state;
  }

  Future<void> _deleteFav(Meal meal) async {
    await _deleteFavUsecase(meal.idMeal ?? '');
  }
}
