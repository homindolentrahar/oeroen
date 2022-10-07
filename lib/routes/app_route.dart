import 'package:get/get.dart';
import 'package:oeroen/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/landing_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/register_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/splash_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/detail_urunan_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/invoice_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/payment_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/urunan_screen.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String landingRoute = "/landing";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String mainRoute = "/main";
  static const String urunanRoute = "/urunan";
  static const String paymentRoute = "/payment";
  static const String invoiceRoute = "/invoice";

  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: landingRoute,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: loginRoute,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: registerRoute,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: mainRoute,
      page: () => const UrunanScreen(),
    ),
    GetPage(
      name: "$urunanRoute/:id",
      page: () => const DetailUrunanScreen(item: null),
      children: <GetPage>[
        GetPage(
          name: paymentRoute,
          page: () => const PaymentScreen(item: null),
        ),
        GetPage(
          name: invoiceRoute,
          page: () => const InvoiceScreen(),
        ),
      ],
    ),
  ];
}
