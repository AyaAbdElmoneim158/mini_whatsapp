import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;
  static double defaultPadding = 24.0;
  static double defaultBtwFields = 20.0;

  static double borderRadiusSm = 4.0.r;
  static double borderRadiusMd = 8.0.r;
  static double borderRadiusLg = 12.0.r;

  static const double borderSide = 1.0;

  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

  static double dividerHeight = 1.0.h;
  static double appBarHeight = 56.0.h;
  static double bottomNavigationBarHeight = 74.h;
}
