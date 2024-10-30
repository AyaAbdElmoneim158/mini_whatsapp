import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  AppStyles._();
  static TextStyle font244BlackBold = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle font24BlackBold(context) => Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle font14BlackRegular(context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle font14LightGrayRegular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textHintGray,
  );

  static TextStyle font14PurpleBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primary,
  );

  static TextStyle font16GrayBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary.withOpacity(0.6),
  );

  static TextStyle font16BlackBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle font12GrayRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textPrimary.withOpacity(0.6),
    height: 18,
  );

  static TextStyle font16GrayRegular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font12DarkMedium = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font19PurpleMedium = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );

  static TextStyle font12MainPurpleMedium = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );

  static TextStyle font19WhiteBold = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font18GrayRegular = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGrey,
  );

  static Decoration? bottomNavigationDecoration = const BoxDecoration(
    color: AppColors.backgroundLight,
  );
}

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
