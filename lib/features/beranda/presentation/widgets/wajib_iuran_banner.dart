import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/extension/date_extensions.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';

class WajibIuranBanner extends StatelessWidget {
  const WajibIuranBanner({Key? key, required this.totalAmount})
      : super(key: key);

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Wajib Iuran",
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 12,
                  fontFamily: AppFont.medium,
                ),
              ),
              Text(
                DateTime.now().toMMMyyyy(),
                style: const TextStyle(
                  color: AppColor.gray,
                  fontSize: 12,
                  fontFamily: AppFont.medium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: const TextStyle(
                color: AppColor.white,
                fontFamily: AppFont.semiBold,
              ),
              children: [
                const TextSpan(
                  text: "Rp ",
                  style: TextStyle(fontSize: 32),
                ),
                TextSpan(
                  text: totalAmount.toCurrency(),
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppFillButton(
              text: "Lihat Rincian",
              textSize: 14,
              onPressed: totalAmount > 0.0
                  ? () {
                      Get.toNamed(AppRoute.wajibIuranRoute);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
