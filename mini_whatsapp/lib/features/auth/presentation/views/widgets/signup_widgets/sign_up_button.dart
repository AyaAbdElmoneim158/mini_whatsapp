import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/app_button.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/strings.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final void Function() onPressed;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
    required this.phoneController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      text: AppStrings.login,
      padding: AppSizes.lg - 4,
    );
  }
}
