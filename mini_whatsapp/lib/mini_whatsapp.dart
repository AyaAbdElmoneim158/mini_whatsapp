import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'core/utils/constants/strings.dart';
import 'features/splash/splash_view.dart';

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
    };
  }
}
