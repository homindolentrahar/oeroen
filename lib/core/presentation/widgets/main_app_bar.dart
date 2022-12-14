import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/popup_menu_item_child.dart';
import 'package:oeroen/core/presentation/widgets/user_avatar.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, required this.title, this.onTitlePressed})
      : super(key: key);

  final String title;
  final VoidCallback? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        onTitlePressed != null
            ? GestureDetector(
                onTap: onTitlePressed,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Get.textTheme.headline4
                          ?.copyWith(color: AppColor.black),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/icons/ic_chevron_down.svg",
                      width: 20,
                      height: 20,
                      color: AppColor.black,
                    )
                  ],
                ),
              )
            : Text(
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
