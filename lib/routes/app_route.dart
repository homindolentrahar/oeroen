import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/iuran_list_controller.dart';
import 'package:oeroen/core/presentation/screens/iuran_list_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/auth_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/forgot_password_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/auth_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/otp_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/waiting_verification_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/code_desa_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_phone_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_email_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/otp_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/register_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/splash_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/waiting_verification_screen.dart';
import 'package:oeroen/features/beranda/presentation/application/main_controller.dart';
import 'package:oeroen/features/beranda/presentation/screens/beranda_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/wajib_iuran_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/detail_desa_screen.dart';
import 'package:oeroen/core/presentation/screens/main_screen.dart';
import 'package:oeroen/features/iuran/presentation/screens/bindings/iuran_binding.dart';
import 'package:oeroen/features/iuran/presentation/screens/iuran_screen.dart';
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
  static const String landingRoute = "/landing";
  static const String mainRoute = "/main";
  static const String mainBerandaRoute = "/beranda";
  static const String mainDesaRoute = "/desa";
  static const String mainIuranRoute = "/iuran";
  static const String wajibIuranRoute = "/wajib-iuran";
  static const String iuranListRoute = "/iuran-list";
  static const String waitingVerificationRoute = "/waiting-verification";
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
      binding: AuthBinding(),
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
      name: otpRoute,
      page: () {
        final data = Get.arguments as Map<String, dynamic>;
        final verificationId = data['verificationId'];
        final phoneNumber = data['phone'];

        return OtpScreen(
          verificationId: verificationId,
          phoneNumber: phoneNumber,
        );
      },
      transition: Transition.rightToLeftWithFade,
      binding: OtpBinding(),
    ),
    GetPage(
      name: registerRoute,
      page: () => const RegisterScreen(),
      transition: Transition.fadeIn,
      binding: AuthBinding(),
    ),
    GetPage(
      name: forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: waitingVerificationRoute,
      page: () => const WaitingVerificationScreen(),
      binding: WaitingVerificationBinding(),
    ),
    GetPage(
      name: codeDesaRoute,
      page: () => const CodeDesaScreen(),
    ),
    GetPage(
      name: mainRoute,
      transition: Transition.fadeIn,
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.put<MainController>(MainController());
      }),
      children: [
        GetPage(
          name: mainBerandaRoute,
          page: () => const BerandaScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: mainDesaRoute,
          page: () => const DesaScreen(),
          transition: Transition.fadeIn,
        ),
      ],
    ),
    GetPage(
      name: mainIuranRoute,
      page: () => const IuranScreen(),
      transition: Transition.downToUp,
      binding: IuranBinding()
    ),
    GetPage(
      name: wajibIuranRoute,
      page: () => const WajibIuranScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: iuranListRoute,
      page: () => const IuranListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<IuranListController>(() => IuranListController());
      }),
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
    GetPage(
      name: "$mainDesaRoute/:id",
      page: () => const DetailDesaScreen(),
    ),
  ];
}
