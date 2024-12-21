import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import 'login_button.dart';
import 'login_email_field.dart';
import 'login_footer.dart';
import 'login_logo_and_text.dart';
import 'login_password_field.dart';

Widget buildLoginForm(
  BuildContext context,
  GlobalKey<FormState> loginFormKey,
  TextEditingController loginEmailController,
  TextEditingController loginPasswordController,
) {
  return Form(
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
          onPressed: () {
            if (loginFormKey.currentState!.validate()) {
              _login(context, loginEmailController, loginPasswordController);
            }
          },
        ),
        AppSizes.verticalSpace(AppSizes.defaultSpace),
        const LoginFooter(),
      ],
    ),
  );
}

void _login(
  BuildContext context,
  TextEditingController loginEmailController,
  TextEditingController loginPasswordController,
) {
  context.read<AuthCubit>().login(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
}
