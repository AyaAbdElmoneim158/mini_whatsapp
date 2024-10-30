import 'package:flutter/material.dart';

import '../../../../../../core/common/app_field.dart';
import '../../../../../../core/utils/constants/strings.dart';

class SignUpPasswordField extends StatelessWidget {
  final TextEditingController controller;

  const SignUpPasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: AppStrings.password,
      labelText: AppStrings.password,
      controller: controller,
      prefixIcon: const Icon(Icons.lock),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
