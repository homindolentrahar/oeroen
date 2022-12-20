import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/image_load.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';

class IuranMetodePembayaranItem extends StatelessWidget {
  const IuranMetodePembayaranItem({Key? key, required this.data})
      : super(key: key);

  final DesaPaymentMethod data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageLoad(
          image: data.image ?? "assets/images/gopay.png",
          width: 48,
          height: 48,
          radius: 360,
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name ?? "",
              style: Get.textTheme.headline5?.copyWith(color: AppColor.black),
            ),
            const SizedBox(width: 4),
            Text(
              data.number ?? "",
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
