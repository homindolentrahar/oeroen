import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class IuranFilterSheetCategory extends StatelessWidget {
  const IuranFilterSheetCategory({
    Key? key,
    this.initialValue,
    required this.onSelect,
  }) : super(key: key);

  final IuranFilter? initialValue;
  final ValueChanged<IuranFilter?> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Constants.iuranFilters
            .where((item) => item.type == IuranFilterType.category)
            .length,
        itemBuilder: (ctx, index) {
          final item = Constants.iuranFilters
              .where((item) => item.type == IuranFilterType.category)
              .toList()[index];
          return IuranFilterCategoryItem(
            category: item,
            selected: item.slug == initialValue?.slug,
            onSelect: (category) => onSelect(category),
          );
        },
        separatorBuilder: (ctx, index) => const SizedBox(width: 16),
      ),
    );
  }
}

class IuranFilterCategoryItem extends StatelessWidget {
  final IuranFilter? category;
  final bool selected;
  final ValueChanged<IuranFilter?> onSelect;

  const IuranFilterCategoryItem({
    Key? key,
    this.category,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: selected ? Get.theme.primaryColor : AppColor.light,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => onSelect(category),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                category?.icon ?? "",
                width: 20,
                height: 20,
                color: selected ? AppColor.white : AppColor.gray,
              ),
            ),
          ),
        ),
        if (selected) ...[
          const SizedBox(height: 8),
          Text(
            category?.title ?? "",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
        ]
      ],
    );
  }
}
