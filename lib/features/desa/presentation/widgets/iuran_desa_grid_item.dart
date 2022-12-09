import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';
import 'package:oeroen/utils/extension/date_extensions.dart';

class IuranDesaGridItem extends StatelessWidget {
  const IuranDesaGridItem({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  final IuranDesa data;
  final ValueChanged<IuranDesa> onPressed;

  @override
  Widget build(BuildContext context) {
    final iuranCategory = Constants.iuranCategories
        .firstWhere((element) => element.categorySlug == data.categorySlug);

    return Material(
      color: AppColor.light,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onPressed(data),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      iuranCategory.categoryIcon ??
                          "assets/icons/ic_keamanan.svg",
                      width: 20,
                      height: 20,
                      color: AppColor.dark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Iuran ${data.iuranType}",
                        style: Get.textTheme.caption?.copyWith(
                          color: AppColor.dark,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data.iuranPeriod?.toDisplayPeriodDate() ?? "Mei 2022",
                        style: Get.textTheme.caption?.copyWith(
                          color: AppColor.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                iuranCategory.categoryName ?? "",
                style: Get.textTheme.headline5?.copyWith(color: AppColor.black),
              ),
              const SizedBox(height: 4),
              Text(
                data.amount?.toCurrency() ?? "",
                style: Get.textTheme.headline5?.copyWith(
                  color: Get.theme.primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
