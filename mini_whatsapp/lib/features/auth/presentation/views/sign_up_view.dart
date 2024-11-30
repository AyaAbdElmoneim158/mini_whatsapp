import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../injection_container.dart';
import '../view_model/auth_cubit/auth_cubit.dart';
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

    return BlocProvider(
      create: (_) => sl<AuthCubit>(), // Using GetIt for dependency injection
      child: FullScrollScreenContainer(
        hasHight: true,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: _authStateListener(context),
          builder: (context, state) {
            return _buildSignUpForm(
              context,
              signUpFormKey,
              signUpUsernameController,
              signUpEmailController,
              signUpPhoneController,
              signUpPasswordController,
            );
          },
        ),
      ),
    );
  }

  // Listener for authentication state changes
  void Function(BuildContext, AuthState) _authStateListener(BuildContext context) {
    return (context, state) {
      if (state is AuthLoadingState) {
        _showLoadingDialog(context);
      } else if (state is AuthSuccessState) {
        _handleSuccess(context);
      } else if (state is AuthErrorState) {
        _handleError(context, state);
      }
    };
  }

  // Show loading dialog while signing up
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Handle success state
  void _handleSuccess(BuildContext context) {
    Navigator.of(context).pop(); // Close the loading dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign Up Successful!')),
    );
  }

  // Handle error state
  void _handleError(BuildContext context, AuthErrorState state) {
    Navigator.of(context).pop(); // Close the loading dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error)),
    );
  }

  // Build the sign-up form UI
  Widget _buildSignUpForm(
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
    context.read<AuthCubit>().register(
          // username: signUpUsernameController.text.trim(),
          email: signUpEmailController.text.trim(),
          // phone: signUpPhoneController.text.trim(),
          password: signUpPasswordController.text.trim(),
        );
  }
}
