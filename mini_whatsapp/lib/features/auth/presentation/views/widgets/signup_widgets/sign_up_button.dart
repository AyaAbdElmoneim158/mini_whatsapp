import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/app_button.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/strings.dart';
import '../../../../../../core/utils/function_helper.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          HelperFunctions.showSnackbar(context, message: "Login.....!");
          HelperFunctions.showSnackbar(context, message: "Congratulations on successfully signing up! 🎉");
          // Navigator.of(context).pushReplacementNamed('/navigation');
        }
      },
      text: AppStrings.login,
      padding: AppSizes.lg - 4,
    );
  }
}
