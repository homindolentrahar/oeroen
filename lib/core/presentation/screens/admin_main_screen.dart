import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/popup_menu_item_child.dart';
import 'package:oeroen/core/presentation/widgets/user_avatar.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        highlightElevation: 0,
        onPressed: () {},
        label: const Text("Tambah Desa"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: UserAvatar(
                  items: [
                    PopupMenuItem(
                      value: 'logout',
                      onTap: () {
                        Get.find<AuthController>().signOut();
                      },
                      child: const PopupMenuItemChild(
                        icon: "assets/icons/ic_sign_out.svg",
                        title: "Keluar",
                        textColor: AppColor.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
