import 'package:flutter/material.dart';
// import 'package:mini_whatsapp/features/auth/presentation/views/login_view.dart';

import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'core/utils/constants/strings.dart';
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
          // home: const LoginView(),
          initialRoute: AppRoutes.loginRoute, //!.initRoute,
          onGenerateRoute: AppRouter.onGenerate,
        );
      },
    );
  }
}
