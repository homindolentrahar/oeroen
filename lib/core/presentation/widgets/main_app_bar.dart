import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/popup_menu_item_child.dart';
import 'package:oeroen/core/presentation/widgets/user_avatar.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Get.textTheme.headline4?.copyWith(color: AppColor.black),
        ),
        UserAvatar(
          items: [
            PopupMenuItem(
              value: 'profile',
              onTap: () {},
              padding: const EdgeInsets.all(0),
              child: const PopupMenuItemChild(
                icon: "assets/icons/ic_profile.svg",
                title: "Profil",
              ),
            ),
            PopupMenuItem(
              value: 'logout',
              onTap: () {
                Get.find<AuthController>().signOut();
              },
              padding: const EdgeInsets.all(0),
              child: const PopupMenuItemChild(
                icon: "assets/icons/ic_sign_out.svg",
                title: "Keluar",
                textColor: AppColor.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
