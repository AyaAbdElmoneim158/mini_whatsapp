import 'package:flutter/material.dart';

import '../../../../../../core/common/app_field.dart';
import '../../../../../../core/utils/constants/strings.dart';

class SignUpUsernameField extends StatelessWidget {
  final TextEditingController controller;

  const SignUpUsernameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: AppStrings.username,
      labelText: AppStrings.username,
      controller: controller,
      prefixIcon: const Icon(Icons.person),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }
}
