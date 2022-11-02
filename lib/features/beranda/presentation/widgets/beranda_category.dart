import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaCategory {
  final String name;
  final String icon;
  final String route;

  BerandaCategory({
    required this.name,
    required this.icon,
    required this.route,
  });
}

final List<BerandaCategory> categoryItems = [
  BerandaCategory(
    name: "Kebersihan",
    icon: "assets/icons/ic_kebersihan.svg",
    route: "",
  ),
  BerandaCategory(
    name: "Keamanan",
    icon: "assets/icons/ic_keamanan.svg",
    route: "",
  ),
  BerandaCategory(
    name: "Kas",
    icon: "assets/icons/ic_kas.svg",
    route: "",
  ),
  BerandaCategory(
    name: "Arisan",
    icon: "assets/icons/ic_arisan.svg",
    route: "",
  ),
  BerandaCategory(
    name: "Sosial",
    icon: "assets/icons/ic_sosial.svg",
    route: "",
  ),
  BerandaCategory(
    name: "Donasi",
    icon: "assets/icons/ic_donasi.svg",
    route: "",
  ),
];

class BerandaCategoryTiles extends StatelessWidget {
  const BerandaCategoryTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 32,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: categoryItems
            .map((item) => BerandaCategoryTileItem(item: item))
            .toList(),
      ),
    );
  }
}

class BerandaCategoryTileItem extends StatelessWidget {
  final BerandaCategory item;
  final bool showLabel;

  const BerandaCategoryTileItem({
    Key? key,
    required this.item,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoute.iuranListRoute,
          arguments: {
            "title": "Iuran ${item.name}",
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              item.icon,
              width: 20,
              height: 20,
            ),
          ),
          if (showLabel) ...[
            const SizedBox(height: 4),
            Text(
              item.name,
              style: const TextStyle(
                color: AppColor.dark,
                fontSize: 12,
                fontFamily: AppFont.regular,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
