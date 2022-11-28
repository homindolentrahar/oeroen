import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class PaidTypeChip extends StatelessWidget {
  const PaidTypeChip({Key? key, required this.paidSlug, required this.title})
      : super(key: key);

  final String title;
  final String paidSlug;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (paidSlug == "paid" ? AppColor.green : AppColor.red)
            .withOpacity(0.25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: paidSlug == "paid" ? AppColor.green : AppColor.red,
          fontSize: 12,
          fontFamily: AppFont.semiBold,
        ),
      ),
    );
  }
}
