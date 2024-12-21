import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../injection_container.dart';
import '../view_model/auth_cubit/auth_cubit.dart';
import 'widgets/signup_widgets/sign_up_state_listener.dart';
import 'widgets/signup_widgets/sign_up_form.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  late TextEditingController _signUpUsernameController;
  late TextEditingController _signUpEmailController;
  late TextEditingController _signUpPhoneController;
  late TextEditingController _signUpPasswordController;

  @override
  void initState() {
    super.initState();
    _signUpUsernameController = TextEditingController();
    _signUpEmailController = TextEditingController();
    _signUpPhoneController = TextEditingController();
    _signUpPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _signUpUsernameController.dispose();
    _signUpEmailController.dispose();
    _signUpPhoneController.dispose();
    _signUpPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: FullScrollScreenContainer(
        hasHight: true,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: signUpStateListener(context),
          builder: (context, state) {
            return buildSignUpForm(
              context,
              _signUpFormKey,
              _signUpUsernameController,
              _signUpEmailController,
              _signUpPhoneController,
              _signUpPasswordController,
            );
          },
        ),
      ),
    );
  }
}
