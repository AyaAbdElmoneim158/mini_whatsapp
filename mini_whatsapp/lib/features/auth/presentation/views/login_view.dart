import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/full_scroll_screen_container.dart';
import '../../../../injection_container.dart';
import '../view_model/auth_cubit/auth_cubit.dart';
import 'widgets/login_widgets/login_form.dart';
import 'widgets/login_widgets/login_state_listener.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController _loginEmailController;
  late TextEditingController _loginPasswordController;

  @override
  void initState() {
    super.initState();
    _loginEmailController = TextEditingController();
    _loginPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(), // Dependency injection using GetIt
      child: FullScrollScreenContainer(
        hasHight: true,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: loginStateListener(context),
          builder: (context, state) {
            return buildLoginForm(
              context,
              _loginFormKey,
              _loginEmailController,
              _loginPasswordController,
            );
          },
        ),
      ),
    );
  }
}
