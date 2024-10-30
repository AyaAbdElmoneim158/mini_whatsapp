import 'package:flutter/material.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/signup_widgets/sign_up_button.dart';
import 'widgets/signup_widgets/sign_up_email_field.dart';
import 'widgets/signup_widgets/sign_up_footer.dart';
import 'widgets/signup_widgets/sign_up_logo_and_text.dart';
import 'widgets/signup_widgets/sign_up_password_field.dart';
import 'widgets/signup_widgets/sign_up_phone_field.dart';
import 'widgets/signup_widgets/sign_up_username_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpFormKey = GlobalKey<FormState>();
    final signUpUsernameController = TextEditingController();
    final signUpEmailController = TextEditingController();
    final signUpPhoneController = TextEditingController();
    final signUpPasswordController = TextEditingController();

    return FullScrollScreenContainer(
      hasHight: true,
      body: Form(
        key: signUpFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SignUpLogoAndText(),
            AppSizes.verticalSpace(AppSizes.defaultSpace * 2),
            SignUpUsernameField(controller: signUpUsernameController),
            AppSizes.verticalSpace(AppSizes.defaultBtwFields),
            SignUpEmailField(controller: signUpEmailController),
            AppSizes.verticalSpace(AppSizes.defaultBtwFields),
            SignUpPhoneField(controller: signUpPhoneController),
            AppSizes.verticalSpace(AppSizes.defaultBtwFields),
            SignUpPasswordField(controller: signUpPasswordController),
            AppSizes.verticalSpace(AppSizes.defaultSpace),
            SignUpButton(
              formKey: signUpFormKey,
              usernameController: signUpUsernameController,
              emailController: signUpEmailController,
              phoneController: signUpPhoneController,
              passwordController: signUpPasswordController,
            ),
            AppSizes.verticalSpace(AppSizes.defaultSpace),
            const SignUpFooter(),
          ],
        ),
      ),
    );
  }
}
