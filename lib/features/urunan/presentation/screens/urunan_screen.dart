import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
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
  var _currentIndex = 0;
  final _pageController = PageController();
  final List<Map<String, dynamic>> _navItems = [
    {
      "title": "",
      "icon": "assets/icons/beranda.svg",
      "active_icon": "assets/icons/beranda_fill.svg"
    },
    {
      "title": "",
      "icon": "assets/icons/desaku.svg",
      "active_icon": "assets/icons/desaku_fill.svg"
    },
    {
      "title": "",
      "icon": "assets/icons/riwayat.svg",
      "active_icon": "assets/icons/riwayat_fill.svg"
    },
    {
      "title": "",
      "icon": "assets/icons/profile.svg",
      "active_icon": "assets/icons/profile_fill.svg"
    },
  ];
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;

              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          backgroundColor: AppColor.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: _navItems
              .map(
                (item) => BottomNavigationBarItem(
                  label: item['title'],
                  icon: SvgPicture.asset(item['icon']),
                  activeIcon: SvgPicture.asset(
                    item['active_icon'],
                    color: AppColor.primary,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
