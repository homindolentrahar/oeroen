import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/presentation/application/iuran_filter_controller.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet_category.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet_chips.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';

class IuranFilterSheet extends StatelessWidget {
  const IuranFilterSheet({Key? key, this.filters}) : super(key: key);

  final List<IuranFilter>? filters;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IuranFilterController>(
      init: IuranFilterController()..setFilters(filters ?? []),
      builder: (controller) => Container(
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter Iuran",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontFamily: AppFont.semiBold,
                  ),
                ),
                AppTextButton(
                  text: "Batal",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            IuranFilterSheetCategory(
              initialValue: controller.category,
              onSelect: (IuranFilter? value) {
                controller.categoryChanged(value);
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Urutkan",
              style: TextStyle(
                color: AppColor.dark,
                fontSize: 14,
                fontFamily: AppFont.medium,
              ),
            ),
            const SizedBox(height: 8),
            IuranFilterSheetChips(
              initialValue: controller.sort,
              filters: Constants.iuranFilters
                  .where((item) => item.type == IuranFilterType.sort)
                  .toList(),
              onSelect: (IuranFilter? value) {
                controller.sortChanged(value);
              },
            ),
            const SizedBox(height: 8),
            IuranFilterSheetChips(
              initialValue: controller.paidType,
              filters: Constants.iuranFilters
                  .where((item) => item.type == IuranFilterType.paidType)
                  .toList(),
              onSelect: (IuranFilter? value) {
                controller.paidTypeChanged(value);
              },
            ),
            const SizedBox(height: 32),
            AppFillButton(
              text: "Tetapkan",
              onPressed: () {
                Get.back(
                  result: [
                    controller.category,
                    controller.sort,
                    controller.paidType,
                  ].whereNotNull().toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
