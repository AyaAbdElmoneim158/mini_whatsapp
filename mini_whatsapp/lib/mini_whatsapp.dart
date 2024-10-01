import 'package:flutter/material.dart';

import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'core/utils/constants/images.dart';
import 'core/utils/constants/strings.dart';

class MiniWhatsapp extends StatelessWidget {
  const MiniWhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,

      //! Route ----------------------------------------------------------------------
      onGenerateRoute: AppRouter.onGenerate,
      initialRoute: AppRoutes.initRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const NotFoundPage(),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.whatsappBgImage,
              width: 250,
            ),
            const SizedBox(height: 12),
            Text(
              'Sorry, this page was not found',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF83839c),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
