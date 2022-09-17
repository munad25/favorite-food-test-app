import 'package:favorite_meal/core/utils/app_colors.dart';
import 'package:favorite_meal/feature/meal/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MealWidget extends StatelessWidget {
  final Meal meall;
  final bool? isFav;
  final Function()? favAction;
  final Function()? onPress;
  
  const MealWidget({Key? key, required this.meall, this.isFav, this.favAction, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        color: AppColors.neutral10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: 100.r,
              height: 110.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.neutral30,
                image: DecorationImage(
                  image: NetworkImage(meall.strMealThumb ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.neutral80.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 6.w,
                    child: GestureDetector(
                      onTap: favAction,
                      child: Container(
                        width: 24.r,
                        height: 24.r,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.neutral10,
                        ),
                        child: Center(
                          child: Icon(
                            Iconsax.heart5,
                            color: isFav ?? false ? AppColors.dangerMain : AppColors.neutral60,
                            size: 13.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              meall.strMeal ?? '-',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              '${meall.strArea}',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
