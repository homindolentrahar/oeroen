import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

const List<String> _menus = ["Aktif", "Riwayat"];

class IuranMenu extends StatelessWidget {
  const IuranMenu(
      {Key? key, required this.activeIndex, required this.onMenuChanged})
      : super(key: key);

  final int activeIndex;
  final ValueChanged<int> onMenuChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _menus.length,
        itemBuilder: (ctx, index) {
          return IuranMenuItem(
            title: _menus[index],
            isActive: index == activeIndex,
            onPressed: () {
              onMenuChanged(index);
            },
          );
        },
        separatorBuilder: (ctx, index) => const SizedBox(width: 20),
      ),
    );
  }
}

class IuranMenuItem extends StatelessWidget {
  const IuranMenuItem(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.onPressed})
      : super(key: key);

  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.textTheme.bodyText1?.copyWith(
              color: isActive ? Get.theme.primaryColor : AppColor.gray,
              fontFamily: isActive ? AppFont.semiBold : AppFont.medium,
            ),
          ),
          if (isActive)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: BorderRadius.circular(360),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
