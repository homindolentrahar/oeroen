import 'package:auto_route/auto_route.dart';
import 'package:oeroen/features/auth/presentation/screens/landing_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_screen.dart';
import 'package:oeroen/splash_screen.dart';
import 'package:flutter/widgets.dart';

part 'app_routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: SplashScreen.route),
    AutoRoute(page: LandingScreen, path: LandingScreen.route),
    AutoRoute(page: LoginScreen, path: LoginScreen.route),
  ],
)
class AppRouter extends _$AppRouter {}
