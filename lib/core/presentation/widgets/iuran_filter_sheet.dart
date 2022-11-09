import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/application/iuran_filter_controller.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_category.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_paid.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sort.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';

class IuranFilterSheet extends StatelessWidget {
  final Map<String, dynamic>? initialData;

  const IuranFilterSheet({Key? key, this.initialData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IuranFilterController controller = Get.put(IuranFilterController());

    return Obx(
      () => Container(
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
            IuranFilterCategory(category: controller.state.category),
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
            IuranFilterSort(sort: controller.state.sort),
            const SizedBox(height: 8),
            IuranFilterPaid(type: controller.state.paidType),
            const SizedBox(height: 32),
            AppFillButton(
              text: "Tetapkan",
              onPressed: () {
                Get.back(result: controller.state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
