// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/full_scroll_screen_container.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/constants/images.dart';
import '../../core/utils/function_helper.dart';
import '../auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth(context);
  }

  // void _navigateBasedOnAuth(BuildContext context) {
  //   context.read<AuthCubit>().checkAuthStatus();

  //   Future.delayed(const Duration(seconds: 3), () {
  //     context.read<AuthCubit>().stream.listen((state) {
  //       if (state is AuthSuccessState) {
  //         Navigator.of(context).pushReplacementNamed(AppRoutes.navigationMenuRoute);
  //       } else if (state is AuthErrorState || state is AuthInitial) {
  //         Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
  //       }
  //     });
  //   });
  // }
  void _navigateBasedOnAuth(BuildContext context) async {
    await context.read<AuthCubit>().checkAuthStatus();
    context.read<AuthCubit>().stream.listen((state) {
      if (state is AuthSuccessState) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.navigationMenuRoute);
      } else if (state is AuthErrorState || state is AuthInitial) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
      }
    }).onError((error) {
      debugPrint("Error navigating: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FullScrollScreenContainer(
      hasHight: true,
      body: _buildSplashContent(),
    );
  }

  Widget _buildSplashContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppAssets.whatsAppLogo, height: 100),
        HelperFunctions.showLoader(),
      ],
    );
  }
}
