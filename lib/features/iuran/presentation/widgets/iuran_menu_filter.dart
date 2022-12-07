import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_chips.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_controller.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_menu.dart';

class IuranMenuFilter extends StatelessWidget {
  const IuranMenuFilter({Key? key, required this.controller}) : super(key: key);

  final IuranController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: IuranMenu(
                activeIndex: controller.iuranMenuIndex,
                onMenuChanged: (int value) {
                  controller.iuranMenuChanged(value);
                },
              ),
            ),
            Material(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  // TODO: Show the selected filter besides the Sort button
                  final List<IuranFilter>? filter = await Get.bottomSheet(
                    IuranFilterSheet(filters: controller.filters),
                  );

                  if (filter != null) {
                    controller.setFilters(filter);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    "assets/icons/ic_sort.svg",
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        IuranFilterChips(
          emptyTitle: "Semua Iuran",
          filters: controller.filters,
          onRemove: (value) {
            controller.removeFilter(value);
          },
        ),
      ],
    );
  }
}
