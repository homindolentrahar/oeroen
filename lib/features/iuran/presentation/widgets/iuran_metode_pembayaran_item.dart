import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/image_load.dart';

class IuranMetodePembayaranItem extends StatelessWidget {
  const IuranMetodePembayaranItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ImageLoad(
          image: "assets/images/gopay.png",
          width: 48,
          height: 48,
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GoPay",
              style: Get.textTheme.headline5?.copyWith(color: AppColor.black),
            ),
            const SizedBox(width: 4),
            Text(
              "085711223344",
              style: Get.textTheme.bodyText2?.copyWith(
                color: AppColor.gray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
