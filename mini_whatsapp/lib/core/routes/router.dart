import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/splash/splash_view.dart';
import '../../navigation_menu.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    // final args = settings.arguments as String;

    switch (settings.name) {
      case AppRoutes.initRoute:
        return pageTransition(settings, const SplashView());
      case AppRoutes.navigationMenuRoute:
        return pageTransition(settings, const NavigationMenu());

      case AppRoutes.noFoundRoute:
      default:
        return pageTransition(settings, const Scaffold());
    }
  }

  static PageTransition<dynamic> pageTransition(
    RouteSettings settings,
    Widget screen, {
    PageTransitionType type = PageTransitionType.fade,
  }) {
    return PageTransition(
      type: type,
      child: screen,
      settings: settings,
    );
  }
}
