import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class SectionSubtitle extends StatelessWidget {
  const SectionSubtitle({
    Key? key,
    required this.subtitle,
    this.actionSubtitle = "Selengkapnya",
    required this.onPressed,
  }) : super(key: key);

  final String subtitle;
  final String actionSubtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle,
          style: Get.textTheme.bodyText1?.copyWith(
            color: AppColor.dark,
            fontSize: 12,
            fontFamily: AppFont.medium,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionSubtitle,
            style: Get.textTheme.headline5?.copyWith(
              color: AppColor.gray,
              fontSize: 12
            ),
          ),
        ),
      ],
    );
  }
}
