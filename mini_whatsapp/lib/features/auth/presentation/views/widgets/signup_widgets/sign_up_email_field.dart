import 'package:flutter/material.dart';

import '../../../../../../core/common/app_field.dart';
import '../../../../../../core/utils/constants/strings.dart';

class SignUpEmailField extends StatelessWidget {
  final TextEditingController controller;

  const SignUpEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: AppStrings.email,
      labelText: AppStrings.email,
      controller: controller,
      prefixIcon: const Icon(Icons.email),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
}
