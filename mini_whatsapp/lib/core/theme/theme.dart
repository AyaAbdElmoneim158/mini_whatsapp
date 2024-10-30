import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightGrey,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
          color: AppColors.textWhite,
          fontSize: AppSizes.fontSizeLg,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColors.textWhite),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: AppSizes.fontSizeLg,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: AppSizes.fontSizeMd,
          color: AppColors.textSecondary,
        ),
        bodyMedium: TextStyle(
          fontSize: AppSizes.fontSizeSm,
          color: AppColors.textHintGray,
        ),
        bodySmall: TextStyle(
          fontSize: AppSizes.fontSizeSm,
          color: AppColors.textHintGray,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primary,
        size: AppSizes.iconMd,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.buttonPrimary,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          textStyle: const TextStyle(
            fontSize: AppSizes.fontSizeMd,
            color: AppColors.textWhite,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.sm,
            horizontal: AppSizes.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          borderSide: const BorderSide(color: AppColors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          borderSide: const BorderSide(color: AppColors.borderSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        hintStyle: const TextStyle(
          color: AppColors.textHintGray,
          fontSize: AppSizes.fontSizeSm,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSizes.sm,
          horizontal: AppSizes.md,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderSecondary,
        thickness: AppSizes.borderSide,
        space: AppSizes.spaceBtwItems,
      ),
    );
  }
}
