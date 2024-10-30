import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/app_button.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/strings.dart';
import '../../../../../../core/utils/function_helper.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          HelperFunctions.showSnackbar(
            context,
            message: "Great to hear that you successfully logged in! 🎉",
          );
          // Navigator.of(context).pushReplacementNamed('/navigation');
        }
      },
      text: AppStrings.login,
      padding: AppSizes.lg - 4,
    );
  }
}
