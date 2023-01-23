import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/routes/app_route.dart';

const List<String> authType = ["Handphone", "Email"];

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserSignController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: 48,
                    height: 48,
                  ),
                  AppTextButton(
                    text: "Masuk sebagai Desa",
                    onPressed: () {
                      Get.toNamed(AppRoute.adminAuthRoute);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Apa Kabar?",
                    style: TextStyle(
                      fontFamily: AppFont.semiBold,
                      fontSize: 32,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Yuk ikut berkontribusi dalam mengembangkan desa kita tercinta!",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Obx(
                () {
                  return Row(
                    children: authType.map((type) {
                      final index = authType.indexOf(type);
                      final isActive = index == controller.authNavIndex.value;

                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Material(
                            color: isActive
                                ? Get.theme.primaryColor.withOpacity(0.20)
                                : AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                controller.changeNavIndex(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    fontFamily: isActive
                                        ? AppFont.semiBold
                                        : AppFont.medium,
                                    fontSize: 14,
                                    color: isActive
                                        ? Get.theme.primaryColor
                                        : AppColor.dark,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              Expanded(
                child: GetRouterOutlet(
                  initialRoute: AppRoute.authRoute + AppRoute.loginPhoneRoute,
                  anchorRoute: AppRoute.authRoute,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
