import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/chats/presentation/view/chats_details_view.dart';
import '../../features/chats/presentation/view_model/chat_cubit.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/profile/presentation/view_model/profile_cubit.dart';
import '../../features/splash/splash_view.dart';
import '../../injection_container.dart';
import '../../navigation_menu.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initRoute:
        return _pageTransitionWithCubit(settings, const SplashView(), sl<AuthCubit>());
      case AppRoutes.navigationMenuRoute:
        return _pageTransition(settings, const NavigationMenu());
      case AppRoutes.loginRoute:
        return _pageTransitionWithCubit(settings, const LoginView(), sl<AuthCubit>());
      case AppRoutes.signUpRoute:
        return _pageTransitionWithCubit(settings, const SignUpView(), sl<AuthCubit>());
      case AppRoutes.chatDetailsRoute:
        final chatId = settings.arguments as String? ?? '';
        return _pageTransitionWithCubit(settings, ChatDetailsView(chatId: chatId), sl<ChatCubit>());
      case AppRoutes.profileRoute:
        return _pageTransitionWithCubit(settings, const ProfileView(), sl<ProfileCubit>());
      case AppRoutes.noFoundRoute:
      default:
        return _pageTransition(settings, const Scaffold(body: Text("noFoundRoute")));
    }
  }

  static PageTransition<dynamic> _pageTransitionWithCubit(
    RouteSettings settings,
    Widget screen,
    BlocBase cubit, {
    PageTransitionType type = PageTransitionType.fade,
  }) {
    return PageTransition(
      type: type,
      child: BlocProvider.value(
        value: cubit,
        child: screen,
      ),
      settings: settings,
    );
  }

  static PageTransition<dynamic> _pageTransition(
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
