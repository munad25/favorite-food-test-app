import 'package:favorite_meal/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef String? Validation(String? str);
typedef void OnChange(String str);

class SearchField extends StatelessWidget {
  final String title;
  final bool? isNumber;
  final Validation? validation;
  final TextEditingController? controller;
  final bool? enable;
  final bool? secure;
  final Widget? prefix;
  final String? hintText;
  final double? height;
  final OnChange? onchange;
  
  const SearchField({
    Key? key,
    required this.title,
    this.isNumber,
    this.validation,
    this.controller,
    this.enable,
    this.secure,
    this.hintText,
    this.height,
    this.prefix,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextFormField(
        onChanged: onchange,
        controller: controller,
        validator: validation,
        enabled: enable ?? true,
        keyboardType: isNumber ?? false ? TextInputType.number : null,
        obscureText: secure ?? false,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefix,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          // labelText: title,
          labelStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.neutral50,
              fontWeight: FontWeight.w400),
          hintStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.neutral50,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.neutral20),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.neutral30,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.neutral20),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
