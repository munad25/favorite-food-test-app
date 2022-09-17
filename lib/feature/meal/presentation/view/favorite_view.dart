import 'package:favorite_meal/core/utils/app_colors.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:favorite_meal/feature/meal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAvoriteView extends StatelessWidget {
  final favBloc = FavoriteBloc();
  FAvoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favBloc
        ..add(
          GetFavoriteList(),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => Modular.to.navigate(Modular.initialRoute),
                child: Icon(
                  Iconsax.arrow_left,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Favorite Meal',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        body: const FavoriteListWidget(),
      ),
    );
  }
}

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favBloc = BlocProvider.of<FavoriteBloc>(context);
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      bloc: _favBloc,
      builder: (context, state) {
        if (state is FavoriteListLoaded) {
          final mealList = state.favList;
          return ListView.builder(
            itemCount: mealList.length,
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
            itemBuilder: (context, index) => MealRowWidget(
              meal: mealList[index],
              onDismissed: (dir) => _favBloc
                ..add(
                  DeleteFavMealEvent(mealList[index]),
                ),
            ),
          );
        } else {
          return Center(
              child: Text(
            'Favorite data is empty',
            style: TextStyle(color: AppColors.neutral60, fontSize: 14.sp),
          ));
        }
      },
    );
  }
}

class MealRowWidget extends StatelessWidget {
  final Meal meal;
  final Function(DismissDirection)? onDismissed;

  const MealRowWidget({
    Key? key,
    this.onDismissed,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: onDismissed,
      direction: DismissDirection.horizontal,
      background: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.dangerSurface,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Iconsax.trash,
              color: AppColors.dangerMain,
            ),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.neutral10,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.neutral30)),
        child: Row(
          children: [
            Container(
              height: 40.r,
              width: 40.r,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(meal.strMealThumb ?? ''),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.neutral60,
                  borderRadius: BorderRadius.circular(8.r)),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal ?? '',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Origin: ${meal.strArea}',
                  style: TextStyle(color: AppColors.neutral60, fontSize: 12.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
