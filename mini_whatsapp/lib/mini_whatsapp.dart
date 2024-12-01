import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme.dart';
import 'core/utils/constants/strings.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/auth/presentation/views/sign_up_view.dart';
import 'features/chats/presentation/view/chats_details_view.dart';
import 'features/profile/presentation/view/profile_view.dart';
import 'features/splash/splash_view.dart';
import 'navigation_menu.dart';
import 'injection_container.dart'; // Assuming your DI is set up

import 'features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniWhatsapp extends StatelessWidget {
  const MiniWhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
            initialRoute: '/',
            routes: _buildRoutes(),
          );
        });
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/': (context) => BlocProvider<AuthCubit>(
            create: (_) => sl<AuthCubit>(),
            child: const SplashView(),
          ),
      '/home': (context) => const NavigationMenu(),
      '/login': (context) => const LoginView(),
      '/signup': (context) => const SignUpView(),
      '/chatDetails': (context) => const ChatDetailsView(),
      '/profile': (context) => const ProfileView(),
    };
  }
}
