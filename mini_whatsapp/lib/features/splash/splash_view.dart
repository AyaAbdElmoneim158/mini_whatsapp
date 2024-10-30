// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import '../../../../core/common/full_scroll_screen_container.dart';
import '../../core/utils/constants/images.dart';
import '../../core/utils/function_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(context);
  }

  void _navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
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
