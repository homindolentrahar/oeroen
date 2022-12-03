import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/application/iuran_list_controller.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_chips.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';

class IuranListScreen extends StatelessWidget {
  const IuranListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: GetBuilder<IuranListController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          "assets/icons/ic_back.svg",
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        controller.title,
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IuranFilterChips(
                          filters: controller.filters,
                          onRemove: (value) {
                            controller.removeFilter(value);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Material(
                        color: AppColor.light,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () async {
                            // TODO: Show the selected filter besides the Sort button
                            final List<IuranFilter>? filter =
                                await Get.bottomSheet(
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
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (ctx, index) {
                        return IuranListItem(
                          onPressed: () {},
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(height: 16);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
