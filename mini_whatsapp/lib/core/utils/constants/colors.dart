import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF25D366);
  static const Color secondary = Color(0xFF128C7E);
  static const Color accent = Color(0xFF34B7F1);
  static const Color backgroundLight = Color(0xFFECE5DD);
  static const Color backgroundDark = Color(0xFF075E54);

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF25D366),
      Color(0xFF128C7E),
      Color(0xFF075E54),
    ],
    stops: [0.2, 0.5, 0.9],
  );

  static const Color textPrimary = Color(0xFF075E54);
  static const Color textSecondary = Color(0xFF25D366);
  static const Color textHintGray = Color(0xFF6E6E6E);
  static const Color textWhite = Colors.white;

  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFF34B7F1);

  static const Color borderPrimary = Color(0xFF128C7E);
  static const Color borderSecondary = Color(0xFFECE5DD);

  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF25D366);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF34B7F1);

  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
