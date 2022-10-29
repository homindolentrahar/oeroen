import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.canvasColor,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/logo.svg",
          ),
        ),
      ),
    );
  }
}
