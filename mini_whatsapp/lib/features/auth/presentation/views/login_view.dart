import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/mini_whatsapp.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../injection_container.dart';
import '../view_model/auth_cubit/auth_cubit.dart';
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

    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: FullScrollScreenContainer(
        hasHight: true,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: _authStateListener(context),
          builder: (context, state) {
            return _buildLoginForm(
              context,
              loginFormKey,
              loginEmailController,
              loginPasswordController,
            );
          },
        ),
      ),
    );
  }

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

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _handleSuccess(BuildContext context) {
    Navigator.of(context).pop(); // Close the loading dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Successful!')),
    );
  }

  void _handleError(BuildContext context, AuthErrorState state) {
    Navigator.of(context).pop(); // Close the loading dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error)),
    );
  }

  Widget _buildLoginForm(
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
            formKey: loginFormKey,
            usernameController: loginEmailController,
            passwordController: loginPasswordController,
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
}
