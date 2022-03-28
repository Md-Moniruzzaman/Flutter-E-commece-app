import 'package:ecommerce_app/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton(String buttonText, onPressed) {
  return SizedBox(
    height: 50.h,
    width: 160.w,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.deepOrange,
        elevation: 3,
      ),
    ),
  );
}
