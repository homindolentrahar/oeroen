import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_category.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';

class IuranByDesaItem extends StatelessWidget {
  const IuranByDesaItem({super.key, required this.data});

  final IuranDesa data;

  IuranCategory get category =>
      Constants.getIuranCategoryBySlug(data.categorySlug ?? "");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.light,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            category.categoryIcon ?? "",
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          category.categoryName ?? "",
          style: Get.textTheme.bodyText2?.copyWith(
            color: AppColor.dark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          data.amount?.toCurrency() ?? "",
          style: Get.textTheme.caption?.copyWith(
            color: AppColor.black,
            fontFamily: AppFont.semiBold,
          ),
        ),
      ],
    );
  }
}
