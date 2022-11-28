import 'package:get/get.dart';
import 'package:oeroen/routes/app_route.dart';

class NavItem {
  final String label;
  final String icon;
  final String activeIcon;
  final String route;

  NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });
}

class MainController extends GetxController {
  int navIndex = 0;
  final List<NavItem> navItems = [
    NavItem(
      label: "Beranda",
      icon: "assets/icons/ic_beranda.svg",
      activeIcon: "assets/icons/ic_beranda_active.svg",
      route: AppRoute.mainRoute + AppRoute.mainBerandaRoute,
    ),
    NavItem(
      label: "Desa",
      icon: "assets/icons/ic_desa.svg",
      activeIcon: "assets/icons/ic_desa_active.svg",
      route: AppRoute.mainRoute + AppRoute.mainDesaRoute,
    ),
  ];

  void navChanged(int index) {
    navIndex = index;
    Get.rootDelegate.toNamed(navItems[index].route);
    update();
  }
}
