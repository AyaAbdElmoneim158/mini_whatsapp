import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../data/models/user.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';
import 'sign_up_button.dart';
import 'sign_up_email_field.dart';
import 'sign_up_footer.dart';
import 'sign_up_logo_and_text.dart';
import 'sign_up_password_field.dart';
import 'sign_up_phone_field.dart';
import 'sign_up_username_field.dart';

Widget buildSignUpForm(
  BuildContext context,
  GlobalKey<FormState> signUpFormKey,
  TextEditingController signUpUsernameController,
  TextEditingController signUpEmailController,
  TextEditingController signUpPhoneController,
  TextEditingController signUpPasswordController,
) {
  return Form(
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
          onPressed: () {
            if (signUpFormKey.currentState!.validate()) {
              _signUp(context, signUpUsernameController, signUpEmailController, signUpPhoneController,
                  signUpPasswordController);
            }
          },
        ),
        AppSizes.verticalSpace(AppSizes.defaultSpace),
        const SignUpFooter(),
      ],
    ),
  );
}

// Trigger sign-up action in the AuthCubit
void _signUp(
  BuildContext context,
  TextEditingController signUpUsernameController,
  TextEditingController signUpEmailController,
  TextEditingController signUpPhoneController,
  TextEditingController signUpPasswordController,
) {
  final user = UserModel(
    email: signUpEmailController.text.trim(),
    password: signUpPasswordController.text.trim(),
    phone: signUpPhoneController.text.trim(),
    name: signUpUsernameController.text.trim(),
    id: "",
  );
  context.read<AuthCubit>().register(user: user);
}
