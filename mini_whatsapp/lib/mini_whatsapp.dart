import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'core/utils/constants/strings.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/auth/presentation/views/sign_up_view.dart';
import 'features/splash/splash_view.dart';
import 'navigation_menu.dart';

class MiniWhatsapp extends StatelessWidget {
  const MiniWhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: _buildRoutes(),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/': (context) => const SplashView(),
      '/navigation': (context) => const NavigationMenu(),
      '/login': (context) => const LoginView(),
      '/signup': (context) => const SignUpView(),
    };
  }
}
