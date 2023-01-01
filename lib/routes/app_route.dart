import 'package:get/get.dart';
import 'package:oeroen/core/presentation/screens/admin_main_screen.dart';
import 'package:oeroen/core/presentation/screens/bindings/admin_main_binding.dart';
import 'package:oeroen/core/presentation/screens/bindings/main_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/admin_auth_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/admin_otp_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/admin_auth_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/admin_otp_binding.dart';
import 'package:oeroen/features/desa/presentation/screens/bindings/desa_add_binding.dart';
import 'package:oeroen/features/desa/presentation/screens/bindings/desa_detail_binding.dart';
import 'package:oeroen/features/desa/presentation/screens/bindings/desa_register_binding.dart';
import 'package:oeroen/features/desa/presentation/screens/bindings/desa_transaction_binding.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_add_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_register_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_transaction_screen.dart';
import 'package:oeroen/features/iuran/presentation/screens/bindings/iuran_list_binding.dart';
import 'package:oeroen/features/iuran/presentation/screens/iuran_list_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/auth_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/forgot_password_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/auth_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/otp_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/bindings/waiting_verification_binding.dart';
import 'package:oeroen/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_phone_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/login_email_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/otp_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/register_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/splash_screen.dart';
import 'package:oeroen/features/auth/presentation/screens/waiting_verification_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/beranda_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/bindings/recent_transaction_binding.dart';
import 'package:oeroen/features/beranda/presentation/screens/bindings/wajib_iuran_binding.dart';
import 'package:oeroen/features/beranda/presentation/screens/recent_transaction_screen.dart';
import 'package:oeroen/features/beranda/presentation/screens/wajib_iuran_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_screen.dart';
import 'package:oeroen/features/desa/presentation/screens/desa_detail_screen.dart';
import 'package:oeroen/core/presentation/screens/main_screen.dart';
import 'package:oeroen/features/iuran/presentation/screens/bindings/iuran_detail_binding.dart';
import 'package:oeroen/features/iuran/presentation/screens/iuran_detail_screen.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String authRoute = "/auth";
  static const String adminAuthRoute = "/admin-auth";
  static const String loginEmailRoute = "/login";
  static const String loginPhoneRoute = "/phone-login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String otpRoute = "/otp";
  static const String adminOtpRoute = "/admin-otp";
  static const String desaRegisterRoute = "/desa-register";
  static const String desaAddRoute = "/desa-add";
  static const String mainRoute = "/main";
  static const String adminMainRoute = "/admin-main";
  static const String mainBerandaRoute = "/beranda";
  static const String mainDesaRoute = "/desa";
  static const String iuranRoute = "/iuran";
  static const String wajibIuranRoute = "/wajib-iuran";
  static const String recentTransactionRoute = "/recent-transaction";
  static const String desaTransactionRoute = "/desa-transaction";
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
      name: adminAuthRoute,
      page: () => const AdmminAuthScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: AdminAuthBinding(),
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
      name: adminOtpRoute,
      page: () => const AdminOtpScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: AdminOtpBinding(),
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
      name: desaRegisterRoute,
      page: () => const DesaRegisterScreen(),
      transition: Transition.fadeIn,
      binding: DesaRegisterBinding(),
    ),
    GetPage(
      name: desaAddRoute,
      page: () => const DesaAddScreen(),
      transition: Transition.downToUp,
      binding: DesaAddBinding(),
    ),
    GetPage(
      name: mainRoute,
      transition: Transition.fadeIn,
      page: () => const MainScreen(),
      binding: MainBinding(),
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
      name: adminMainRoute,
      page: () => const AdminMainScreen(),
      transition: Transition.fadeIn,
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: wajibIuranRoute,
      page: () => const WajibIuranScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: WajibIuranBinding(),
    ),
    GetPage(
      name: recentTransactionRoute,
      page: () => const RecentTransactionScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: RecentTransactionBinding(),
    ),
    GetPage(
      name: desaTransactionRoute,
      page: () => const DesaTransactionScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DesaTransactionBinding(),
    ),
    GetPage(
      name: iuranListRoute,
      page: () => const IuranListScreen(),
      binding: IuranListBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: "$mainDesaRoute/:id",
      page: () => const DesaDetailScreen(),
      binding: DesaDetailBinding(),
    ),
    GetPage(
      name: "$iuranRoute/:id",
      page: () => const IuranDetailScreen(),
      binding: IuranDetailBinding(),
    ),
  ];
}
