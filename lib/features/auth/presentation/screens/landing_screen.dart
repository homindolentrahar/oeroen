import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/routes/app_routes.dart';

class LandingScreen extends StatelessWidget {
  static const route = "/landing";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/images/landing_illust.svg"),
            ),
            const SizedBox(height: 64),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Buat Urunan menjadi hal Mudah",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 40,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Permudah urunan, permudah kehidupan sosial",
                    style: TextStyle(
                      color: AppColor.light,
                      fontSize: 16,
                      fontFamily: AppFont.medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          minWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          color: AppColor.primary,
          focusColor: AppColor.black.withOpacity(0.05),
          highlightColor: AppColor.black.withOpacity(0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mulai Urunan",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontFamily: AppFont.bold,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/arrow_right.svg",
                color: AppColor.black,
              ),
            ],
          ),
          onPressed: () {
            context.router.push(const LoginRoute());
          },
        ),
      ),
    );
  }
}
