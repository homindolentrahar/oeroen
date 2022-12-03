import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';

class CategoryChipItem extends StatelessWidget {
  final IuranFilter? data;
  final VoidCallback onRemove;

  const CategoryChipItem({
    Key? key,
    this.data,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Get.theme.primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            data?.icon ?? "",
            width: 16,
            height: 16,
            color: AppColor.white,
          ),
          const SizedBox(width: 4),
          Text(
            data?.title ?? "",
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              color: AppColor.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
