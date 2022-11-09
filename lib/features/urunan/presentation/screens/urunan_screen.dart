import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';
import 'package:oeroen/features/urunan/presentation/framgents/beranda_fragment.dart';
import 'package:oeroen/features/urunan/presentation/framgents/desaku_fragment.dart';
import 'package:oeroen/features/urunan/presentation/framgents/profile_fragment.dart';
import 'package:oeroen/features/urunan/presentation/framgents/riwayat_fragment.dart';

class UrunanScreen extends StatefulWidget {
  static const route = "/urunan";

  const UrunanScreen({Key? key}) : super(key: key);

  @override
  State<UrunanScreen> createState() => _UrunanScreenState();
}

class _UrunanScreenState extends State<UrunanScreen> {
  final _pageController = PageController();
  final List<Widget> _fragments = [
    const BerandaFragment(),
    const DesakuFragment(),
    const RiwayatFragment(),
    const ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: _fragments.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _fragments[index],
          ),
        ),
        bottomNavigationBar: MaterialButton(
          color: AppColor.red,
          onPressed: () {
            Get.find<AuthController>().signOut();
          },
          child: const Text("Logout", style: TextStyle(color: AppColor.white)),
        ),
      ),
    );
  }
}
