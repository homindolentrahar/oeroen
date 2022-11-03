import 'package:flutter/material.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class PaidTypeChipItem extends StatelessWidget {
  final PaidType? type;
  final ValueChanged<PaidType?>? onRemove;

  const PaidTypeChipItem({
    Key? key,
    this.type,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (type == PaidType.paid ? AppColor.green : AppColor.red)
            .withOpacity(0.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Constants.paidTypeTitle[type] ?? "",
            style: TextStyle(
              color: type == PaidType.paid ? AppColor.green : AppColor.red,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => onRemove?.call(type),
            child: Icon(
              Icons.close,
              color: type == PaidType.paid ? AppColor.green : AppColor.red,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
