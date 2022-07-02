import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

class ActiveUrunanItem extends StatelessWidget {
  final UrunanItem item;
  final ValueChanged<UrunanItem> onPressed;

  const ActiveUrunanItem(
      {Key? key, required this.item, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
      ),
      child: Material(
        color: AppColor.dark,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          splashColor: AppColor.black.withOpacity(0.25),
          highlightColor: AppColor.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          onTap: () => onPressed(item),
          child: Container(
            width: 136,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColor.primary.withOpacity(0.15),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  typeIcons[item.type].toString(),
                  width: 24,
                  height: 24,
                  color: typeColors[item.type],
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        symbol: "",
                      ).format(item.amount),
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontFamily: AppFont.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.type.name,
                      style: const TextStyle(
                        color: AppColor.light,
                        fontSize: 12,
                        fontFamily: AppFont.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    DateFormat("dd MMMM yyyy").format(DateTime.now()),
                    style: const TextStyle(
                      color: AppColor.gray,
                      fontSize: 10,
                      fontFamily: AppFont.bold,
                    ),
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
