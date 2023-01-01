import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/application/iuran_list_controller.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_filter_section.dart';
import 'package:oeroen/routes/app_route.dart';

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
                  IuranFilterSection(
                    initialFilters: controller.filters,
                    onRemoveFilter: (value) {
                      controller.removeFilter(value);
                    },
                    onTapShowSheet: () async {
                      final List<IuranFilter>? filter = await Get.bottomSheet(
                        IuranFilterSheet(filters: controller.filters),
                      );

                      if (filter != null) {
                        controller.setFilters(filter);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.allIuran.length,
                      itemBuilder: (ctx, index) => IuranListItem(
                        data: controller.allIuran[index],
                        onPressed: (data) {
                          Get.toNamed(
                            "${AppRoute.mainIuranRoute}/${data.id}",
                            parameters: {'desa_code': data.desaCode ?? ""},
                          );
                        },
                      ),
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
