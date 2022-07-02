import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

class UrunanListItem extends StatelessWidget {
  final UrunanItem item;
  final ValueChanged<UrunanItem> onPressed;

  const UrunanListItem({Key? key, required this.item, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.darker,
        child: InkWell(
          splashColor: AppColor.black.withOpacity(0.25),
          highlightColor: AppColor.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          onTap: () => onPressed(item),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: typeColors[item.type]?.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    typeIcons[item.type].toString(),
                    color: typeColors[item.type],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.type.name,
                        style: TextStyle(
                          color: typeColors[item.type],
                          fontSize: 16,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat("dd MMMM yyyy").format(item.timestamp),
                        style: const TextStyle(
                          color: AppColor.gray,
                          fontSize: 10,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 0,
                    symbol: "",
                  ).format(item.amount),
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontFamily: AppFont.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
