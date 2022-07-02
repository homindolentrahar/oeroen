import 'package:auto_route/auto_route.dart';
import 'package:oeroen/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/landing_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/register_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/detail_urunan_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/payment_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/urunan_screen.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';
import 'package:oeroen/splash_screen.dart';
import 'package:flutter/widgets.dart';

part 'app_routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: SplashScreen.route),
    AutoRoute(page: LandingScreen, path: LandingScreen.route),
    AutoRoute(page: LoginScreen, path: LoginScreen.route),
    AutoRoute(page: RegisterScreen, path: RegisterScreen.route),
    AutoRoute(page: ForgotPasswordScreen, path: ForgotPasswordScreen.route),
    AutoRoute(page: UrunanScreen, path: UrunanScreen.route),
    AutoRoute(page: DetailUrunanScreen, path: DetailUrunanScreen.route),
    AutoRoute(page: PaymentScreen, path: PaymentScreen.route),
  ],
)
class AppRouter extends _$AppRouter {}
