import 'package:flutter/material.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/login_widgets/login_button.dart';
import 'widgets/login_widgets/login_footer.dart';
import 'widgets/login_widgets/login_logo_and_text.dart';
import 'widgets/login_widgets/login_password_field.dart';
import 'widgets/login_widgets/login_email_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    final loginEmailController = TextEditingController();
    final loginPasswordController = TextEditingController();

    return FullScrollScreenContainer(
      hasHight: true,
      body: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoginLogoAndText(),
            AppSizes.verticalSpace(AppSizes.defaultSpace * 2),
            LoginEmailField(controller: loginEmailController),
            AppSizes.verticalSpace(AppSizes.defaultBtwFields),
            LoginPasswordField(controller: loginPasswordController),
            AppSizes.verticalSpace(AppSizes.defaultSpace),
            LoginButton(
              formKey: loginFormKey,
              usernameController: loginEmailController,
              passwordController: loginPasswordController,
            ),
            AppSizes.verticalSpace(AppSizes.defaultSpace),
            const LoginFooter(),
          ],
        ),
      ),
    );
  }
}
