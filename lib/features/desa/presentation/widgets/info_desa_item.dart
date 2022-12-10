import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

enum InfoDesaType {
  population,
  area,
  zipCode,
}

class InfoDesa {
  final String title;
  final String value;
  final String icon;

  InfoDesa({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class InfoDesaItem extends StatelessWidget {
  const InfoDesaItem({Key? key, required this.info}) : super(key: key);

  final InfoDesa info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          info.icon,
          width: 16,
          height: 16,
          color: AppColor.gray,
        ),
        const SizedBox(height: 8),
        Text(
          info.value,
          style: Get.textTheme.bodyText1?.copyWith(
            color: AppColor.black,
            fontFamily: AppFont.semiBold,
          ),
        ),
        Text(
          info.title,
          style: Get.textTheme.caption?.copyWith(
            color: AppColor.gray,
            fontFamily: AppFont.medium,
          ),
        ),
      ],
    );
  }
}
