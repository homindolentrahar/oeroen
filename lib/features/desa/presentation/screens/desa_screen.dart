import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/core/presentation/widgets/main_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/presentation/application/desa_controller.dart';
import 'package:oeroen/features/desa/presentation/widgets/desa_list_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/info_desa_banner.dart';
import 'package:oeroen/features/desa/presentation/widgets/iuran_desa_grid_item.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/routes/app_route.dart';

class DesaScreen extends StatelessWidget {
  const DesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesaController>(builder: (controller) {
      return ListView(
        padding: const EdgeInsets.all(32),
        physics: const BouncingScrollPhysics(),
        children: [
          MainAppBar(
            title: "Desa",
            onTitlePressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Desamu",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.wargaDesa.length + 1,
                          itemBuilder: (ctx, index) {
                            if (index == controller.wargaDesa.length) {
                              return AppTextButton(
                                text: "Tambah Desa",
                                icon: SvgPicture.asset(
                                  "assets/icons/add.svg",
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.75),
                                ),
                                textColor:
                                    Get.theme.primaryColor.withOpacity(0.75),
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed(AppRoute.desaAddRoute);
                                },
                              );
                            } else {
                              return WargaDesaListItem(
                                isSelected: controller.wargaDesa[index].id ==
                                    controller.selectedDesaId,
                                data: controller.wargaDesa[index],
                                onPressed: (desa) {
                                  if (desa.id != controller.selectedDesaId) {
                                    controller.selectDesa(desa);
                                  }
                                },
                              );
                            }
                          },
                          separatorBuilder: (ctx, index) =>
                              const SizedBox(height: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                enableDrag: false,
                backgroundColor: Get.theme.canvasColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          InfoDesaBanner(data: controller.desa),
          const SizedBox(height: 32),
          SectionSubtitle(subtitle: "Iuran di Desa ${controller.desa.name}"),
          const SizedBox(height: 16),
          SizedBox(
            height: 144,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.desa.iurans?.length ?? 0,
              itemBuilder: (ctx, index) => IuranDesaGridItem(
                data: controller.desa.iurans?[index] ?? IuranDesa(),
                onPressed: (data) {},
              ),
              separatorBuilder: (ctx, index) => const SizedBox(width: 16),
            ),
          ),
          const SizedBox(height: 32),
          SectionSubtitle(
            subtitle: "Transaksi Desa",
            onPressed: () {
              Get.toNamed(
                AppRoute.desaTransactionRoute,
                arguments: {
                  "title": controller.desa.name,
                },
              );
            },
          ),
          const SizedBox(height: 16),
          controller.iuranDesa.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => IuranListItem(
                    isTransaction: true,
                    data: controller.iuranDesa[index],
                    onPressed: (data) {},
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemCount: controller.iuranDesa.take(8).length,
                )
              : SizedBox(
                  height: 240,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_empty.svg",
                        width: 64,
                        height: 64,
                        color: AppColor.gray.withOpacity(0.25),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Data tidak ditemukan",
                        style: Get.textTheme.bodyText1?.copyWith(
                          color: AppColor.gray,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      );
    });
  }
}
