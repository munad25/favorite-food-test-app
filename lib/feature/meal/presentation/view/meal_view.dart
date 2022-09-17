import 'package:favorite_meal/config/router/app_route.dart';
import 'package:favorite_meal/core/utils/app_colors.dart';
import 'package:favorite_meal/feature/meal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:favorite_meal/feature/meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:favorite_meal/feature/meal/presentation/widget/meal_widget.dart';
import 'package:favorite_meal/feature/meal/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MealView extends StatefulWidget {
  const MealView({Key? key}) : super(key: key);

  @override
  State<MealView> createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  final mealBloc = MealBloc();
  final favBloc = FavoriteBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => mealBloc
            ..add(
              GetMealList(),
            ),
        ),
        BlocProvider(
          create: (context) => favBloc..add(GetAllFavMeal()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100.h),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(
                      onchange: (str) => mealBloc.add(SearchMeal(str)),
                      title: 'Search',
                      height: 36.h,
                      hintText: 'Search',
                      prefix: Icon(
                        Iconsax.search_normal,
                        color: AppColors.mainColor,
                        size: 16.r,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () => Modular.to.navigate(AppRoute.FAVORITE_PAGE),
                    child: Icon(
                      Iconsax.heart5,
                      size: 30.sp,
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: const MealListWidget(),
      ),
    );
  }
}

class MealListWidget extends StatelessWidget {
  const MealListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favBloc = BlocProvider.of<FavoriteBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<MealBloc, MealState>(
        bloc: BlocProvider.of<MealBloc>(context),
        builder: (context, state) {
          if (state is MealLoaded) {
            return BlocBuilder<FavoriteBloc, FavoriteState>(
              bloc: _favBloc,
              builder: (context, favstate) => GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.meals.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 5.h),
                itemBuilder: (context, index) => MealWidget(
                  meall: state.meals[index],
                  onPress: () => Modular.to.navigate('/meal/${state.meals[index].idMeal}'),
                  favAction: () {
                    final isFav = favstate is FavoriteLoaded &&
                        favstate.favoriteIds
                            .contains(state.meals[index].idMeal);
                    if (isFav) {
                      _favBloc.add(DeleteFavMealEvent(state.meals[index]));
                    } else {
                      _favBloc.add(AddFavoriteMeal(state.meals[index]));
                    }
                  },
                  isFav: favstate is FavoriteLoaded &&
                      favstate.favoriteIds.contains(
                        state.meals[index].idMeal,
                      ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
