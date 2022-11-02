import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/beranda/presentation/widgets/beranda_banner.dart';
import 'package:oeroen/features/beranda/presentation/widgets/beranda_category.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Beranda",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 20,
                fontFamily: AppFont.semiBold,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.asset(
                "assets/images/img_placeholder_avatar.png",
                width: 48,
                height: 48,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const BerandaBanner(),
        const SizedBox(height: 32),
        const BerandaCategoryTiles(),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pembayaran Terkini",
              style: TextStyle(
                color: AppColor.dark,
                fontSize: 14,
                fontFamily: AppFont.medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoute.iuranListRoute,
                  arguments: {
                    "title": "Pembayaran Terkini",
                  },
                );
              },
              child: const Text(
                "Selengkapnya",
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 14,
                  fontFamily: AppFont.semiBold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 320,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (ctx, index) {
              return IuranListItem(
                onPressed: () {},
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 16);
            },
          ),
        ),
      ],
    );
  }
}
