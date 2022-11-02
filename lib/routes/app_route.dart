import 'package:get/get.dart';
import 'package:oeroen/core/presentation/screens/iuran_list_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/auth_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/forgot_password_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/user_sign_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/code_desa_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/landing_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_phone_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_email_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/otp_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/register_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/splash_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/waiting_verification_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/beranda_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/wajib_iuran_screen.dart';
import 'package:oeroen/features/main_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/detail_urunan_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/invoice_screen.dart';
import 'package:oeroen/features/urunan/presentation/screens/payment_screen.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String authRoute = "/auth";
  static const String loginEmailRoute = "/login";
  static const String loginPhoneRoute = "/phone-login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String otpRoute = "/otp";
  static const String codeDesaRoute = "/code-desa";
  static const String waitingVerification = "/waiting-verification";
  static const String landingRoute = "/landing";
  static const String mainRoute = "/main";
  static const String mainBerandaRoute = "/main/beranda";
  static const String mainDesaRoute = "/main/desa";
  static const String mainIuranRoute = "/main/iuran";
  static const String wajibIuranRoute = "/wajib-iuran";
  static const String iuranListRoute = "/iuran-list";
  static const String urunanRoute = "/urunan";
  static const String paymentRoute = "/payment";
  static const String invoiceRoute = "/invoice";

  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: authRoute,
      page: () => const AuthScreen(),
      transition: Transition.fadeIn,
      binding: UserSignBinding(),
      children: [
        GetPage(
          name: loginEmailRoute,
          page: () => const LoginEmailScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: loginPhoneRoute,
          page: () => const LoginPhoneScreen(),
          transition: Transition.leftToRightWithFade,
        ),
      ],
    ),
    GetPage(
      name: registerRoute,
      page: () => const RegisterScreen(),
      binding: UserSignBinding(),
    ),
    GetPage(
      name: forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: otpRoute,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: landingRoute,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: codeDesaRoute,
      page: () => const CodeDesaScreen(),
    ),
    GetPage(
      name: waitingVerification,
      page: () => const WaitingVerificationScreen(),
    ),
    GetPage(
      name: mainRoute,
      transition: Transition.fadeIn,
      page: () => const MainScreen(),
      children: [
        GetPage(
          name: mainBerandaRoute,
          page: () => const BerandaScreen(),
        ),
      ],
    ),
    GetPage(
      name: wajibIuranRoute,
      page: () => const WajibIuranScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: iuranListRoute,
      page: () {
        final Map<String, dynamic> data = Get.arguments;
        final title = data['title'];

        return IuranListScreen(title: title);
      },
      transition: Transition.rightToLeftWithFade,
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
