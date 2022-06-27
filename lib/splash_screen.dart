import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        context.router.replace(const LandingRoute());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Oeroen",
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
