import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class SortChipItem extends StatelessWidget {
  final IuranFilter? data;
  final VoidCallback onRemove;

  const SortChipItem({
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
        color: Get.theme.primaryColor.withOpacity(0.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data?.title ?? "",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              color: Get.theme.primaryColor,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
