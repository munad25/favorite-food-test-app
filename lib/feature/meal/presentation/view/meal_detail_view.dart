import 'dart:developer';

import 'package:favorite_meal/config/router/app_route.dart';
import 'package:favorite_meal/core/utils/app_colors.dart';
import 'package:favorite_meal/feature/meal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:favorite_meal/feature/meal/presentation/bloc/meal_detail/meal_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MealDetailView extends StatelessWidget {
  final String id;
  final mealDbloc = MealDetailBloc();
  final favBloc = FavoriteBloc();
  MealDetailView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => mealDbloc
            ..add(
              GetMealEvent(id),
            ),
        ),
        BlocProvider(
          create: (context) => favBloc
            ..add(
              GetAllFavMeal(),
            ),
        ),
      ],
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors.mainColor,
        //   title: Row(
        //     children: [
        //       GestureDetector(
        //         onTap: () => Modular.to.navigate(Modular.initialRoute),
        //         child: Icon(Iconsax.arrow_left),
        //       ),
        //       SizedBox(width: 8.w),
        //       const BuildAppBarTitle(),
        //     ],
        //   ),
        // ),
        body: const MealDetailWidget(),
      ),
    );
  }
}

class MealDetailWidget extends StatelessWidget {
  const MealDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealDBloc = BlocProvider.of<MealDetailBloc>(context);
    final favBloc = BlocProvider.of<FavoriteBloc>(context);
    return BlocBuilder<MealDetailBloc, MealDetailState>(
      bloc: mealDBloc,
      builder: (context, state) {
        if (state is MealDetailLoaded) {
          return Column(
            children: [
              Container(
                height: 224.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(state.meal.strMealThumb ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40.h,
                      left: 20.w,
                      child: GestureDetector(
                        onTap: () => Modular.to.navigate(Modular.initialRoute),
                        child: Container(
                          width: 32.r,
                          height: 32.r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.neutral10),
                          child: Center(
                            child: Icon(Iconsax.arrow_left,
                                color: AppColors.mainColor, size: 20.w),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      right: 20.w,
                      child: BlocBuilder<FavoriteBloc, FavoriteState>(
                        bloc: favBloc,
                        builder: (context, favState) {
                          return TextButton(
                            onPressed: () {
                              final isFav = favState is FavoriteLoaded &&
                                  favState.favoriteIds.contains(
                                    state.meal.idMeal,
                                  );
                              if (isFav) {
                                favBloc.add(
                                  DeleteFavMealEvent(state.meal),
                                );
                              } else {
                                favBloc.add(
                                  AddFavoriteMeal(state.meal),
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Container(
                              width: 32.r,
                              height: 32.r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: AppColors.neutral10),
                              child: Center(
                                child: Icon(
                                  Iconsax.heart5,
                                  color: favState is FavoriteLoaded &&
                                          favState.favoriteIds
                                              .contains(state.meal.idMeal)
                                      ? AppColors.dangerMain
                                      : AppColors.neutral50,
                                  size: 20.w,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BlocBuilder<MealDetailBloc, MealDetailState>(
                  builder: (context, state) {
                    if (state is MealDetailLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.meal.strMeal ?? '',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Origin: ${state.meal.strArea}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.neutral60),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Instruction :',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.neutral80,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            state.meal.strInstructions ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.neutral80,
                            ),
                          )
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class BuildAppBarTitle extends StatelessWidget {
  const BuildAppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailBloc, MealDetailState>(
      bloc: BlocProvider.of<MealDetailBloc>(context),
      builder: (context, state) {
        if (state is MealDetailLoaded) {
          return Text(
            state.meal.strMeal ?? '',
            style: TextStyle(fontSize: 14.sp),
          );
        } else {
          return Text('-');
        }
      },
    );
  }
}
