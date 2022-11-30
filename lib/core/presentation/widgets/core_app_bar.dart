import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';

class CoreAppBar extends StatelessWidget {
  const CoreAppBar({
    Key? key,
    required this.title,
    this.backEnabled = false,
    this.additionalBackAction,
  }) : super(key: key);

  final String title;
  final bool backEnabled;
  final VoidCallback? additionalBackAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (backEnabled)
          GestureDetector(
            onTap: () {
              additionalBackAction?.call();

              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/ic_back.svg",
              width: 24,
              height: 24,
              color: AppColor.black,
            ),
          ),
        const SizedBox(width: 16),
        Text(
          title,
          style: Get.textTheme.headline4?.copyWith(color: AppColor.black),
        ),
      ],
    );
  }
}
