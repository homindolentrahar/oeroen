import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  final WargaTransaction data;
  final ValueChanged<WargaTransaction> onPressed;

  @override
  Widget build(BuildContext context) {
    final iuranCategory = Constants.iuranCategories
        .firstWhere((element) => element.categorySlug == data.categorySlug);

    return Material(
      color: AppColor.light,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onPressed(data),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  iuranCategory.categoryIcon ?? "assets/icons/ic_empty.svg",
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      iuranCategory.categoryName ?? "",
                      style: Get.textTheme.headline5
                          ?.copyWith(color: AppColor.black),
                    ),
                    // Text(
                    //   isTransaction
                    //       ? (data.paidAt ?? DateTime.now()).toDisplayDate()
                    //       : (data.createdAt ?? DateTime.now()).toDisplayDate(),
                    //   style: const TextStyle(
                    //     color: AppColor.gray,
                    //     fontSize: 12,
                    //     fontFamily: AppFont.regular,
                    //   ),
                    // ),
                    const SizedBox(height: 4),
                    Text(
                      data.desaCode ?? "",
                      style: const TextStyle(
                        color: AppColor.dark,
                        fontSize: 12,
                        fontFamily: AppFont.medium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                (data.amount ?? 0.0).toCurrency(),
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontSize: 14,
                  fontFamily: AppFont.semiBold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
