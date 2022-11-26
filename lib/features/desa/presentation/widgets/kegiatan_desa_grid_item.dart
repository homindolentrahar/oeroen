import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class KegiatanDesaGridItem extends StatelessWidget {
  const KegiatanDesaGridItem({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.light,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/ic_keamanan.svg",
                      width: 16,
                      height: 16,
                      color: AppColor.dark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Keamanan",
                    style: Get.textTheme.bodyText2?.copyWith(
                      color: AppColor.dark,
                      fontFamily: AppFont.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Ronda",
                style: Get.textTheme.bodyText1?.copyWith(
                  color: AppColor.black,
                  fontFamily: AppFont.semiBold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Setiap Hari\n21:00 - 03:00",
                style: Get.textTheme.caption?.copyWith(
                  color: AppColor.dark,
                  fontFamily: AppFont.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
