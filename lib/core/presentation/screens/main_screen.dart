import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/beranda/presentation/application/main_controller.dart';
import 'package:oeroen/routes/app_route.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: GetRouterOutlet(
          initialRoute: AppRoute.mainRoute + AppRoute.mainBerandaRoute,
          anchorRoute: AppRoute.mainRoute,
        ),
      ),
      floatingActionButton: RawMaterialButton(
        elevation: 0,
        highlightElevation: 0,
        fillColor: Get.theme.primaryColor,
        padding: const EdgeInsets.all(24),
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          "assets/icons/ic_iuran.svg",
          color: AppColor.white,
          width: 24,
          height: 24,
        ),
        onPressed: () {
          Get.toNamed(AppRoute.mainIuranRoute);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GetBuilder<MainController>(builder: (controller) {
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: controller.navIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(fontFamily: AppFont.semiBold),
          selectedItemColor: Get.theme.primaryColor,
          selectedFontSize: 12,
          onTap: (index) {
            controller.navChanged(index);
          },
          items: controller.navItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(item.icon),
                  activeIcon: SvgPicture.asset(item.activeIcon),
                  label: item.label,
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
