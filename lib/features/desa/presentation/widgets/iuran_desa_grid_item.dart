import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class IuranDesaGridItem extends StatelessWidget {
  const IuranDesaGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.light,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  "assets/icons/ic_keamanan.svg",
                  width: 20,
                  height: 20,
                  color: AppColor.dark,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Iuran Bulanan",
                    style: Get.textTheme.caption?.copyWith(
                      color: AppColor.dark,
                      fontFamily: AppFont.medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Mei 2022",
                    style: Get.textTheme.caption?.copyWith(
                      color: AppColor.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Keamanan",
            style: Get.textTheme.headline5?.copyWith(color: AppColor.black),
          ),
          const SizedBox(height: 4),
          Text(
            "25.000",
            style: Get.textTheme.headline5?.copyWith(
              color: Get.theme.primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
