import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:reco_genie/features/authentication/presentation/views/login_screen_view.dart';
import 'package:reco_genie/features/home/presentation/views/home_screen_view.dart';
import '../../features/authentication/data/repos/auth_gate.dart';
import '../../features/authentication/presentation/views/register_screen_view.dart';

abstract class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const authScreen = '/authScreenView';
  static const loginScreen = '/LoginScreenView';
  static const registerScreen = '/RegisterScreenView';
  static const homeScreen = '/homeScreenView';

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthGate();
        },
      ),
      GoRoute(
        path: loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreenView();
        },
      ),
      GoRoute(
        path: registerScreen,
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreenView();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return  HomeScreenView();
        },
      ),
    ],
  );
}


