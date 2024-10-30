import 'package:flutter/material.dart';

import '../../../../../../core/common/app_field.dart';
import '../../../../../../core/utils/constants/strings.dart';

class SignUpPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const SignUpPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: AppStrings.phone,
      labelText: AppStrings.phone,
      controller: controller,
      prefixIcon: const Icon(Icons.phone),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone';
        }
        return null;
      },
    );
  }
}
