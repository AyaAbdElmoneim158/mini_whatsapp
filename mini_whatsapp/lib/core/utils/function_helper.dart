// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'constants/colors.dart';

class HelperFunctions {
  // Display a snackbar with custom message and color
  static void showSnackbar(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    int durationInSeconds = 3,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: durationInSeconds),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Validate email format
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Validate phone number format
  static bool isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegex.hasMatch(phone);
  }

  // Format a DateTime object to a readable string
  static String formatDateTime(DateTime dateTime, {String format = 'yyyy-MM-dd HH:mm'}) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  // Navigate to a new screen with optional replacement
  static void navigateTo(BuildContext context, Widget destination, {bool replace = false}) {
    if (replace) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => destination),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => destination),
      );
    }
  }

  // Show a confirmation dialog with custom actions
  static Future<bool?> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  // Convert string to title case
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
        .join(' ');
  }

  // Display a loading indicator
  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(message ?? 'Loading...'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Dismiss the loading dialog
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Center showLoader({double size = 32}) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColors.primary,
        size: size,
      ),
    );
  }
}
