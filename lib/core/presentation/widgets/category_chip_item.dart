import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_category.dart';

class CategoryChipItem extends StatelessWidget {
  final IuranCategory? category;
  final ValueChanged<IuranCategory?>? onRemove;

  const CategoryChipItem({
    Key? key,
    this.category,
    this.onRemove,
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
            category?.categoryIcon ?? "",
            width: 16,
            height: 16,
            color: AppColor.white,
          ),
          const SizedBox(width: 4),
          Text(
            category?.categoryName ?? "",
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => onRemove?.call(category),
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
