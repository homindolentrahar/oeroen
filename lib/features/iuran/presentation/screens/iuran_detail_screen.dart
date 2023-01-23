import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/icon_button_location.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/presentation/widgets/pengurus_desa_list_item.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_category.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_detail_controller.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_by_desa_item.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_metode_pembayaran_item.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/utils/extension/date_extensions.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';

class IuranDetailScreen extends StatelessWidget {
  const IuranDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IuranDetailController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(32),
            physics: const BouncingScrollPhysics(),
            children: [
              CoreAppBar(
                title: "Iuran ${Constants.iuranCategories.firstWhere(
                      (element) =>
                          element.categorySlug ==
                          controller.transaction?.categorySlug,
                      orElse: () => IuranCategory(),
                    ).categoryName}",
                backEnabled: true,
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Periode ${controller.transaction?.createdAt?.toMMMyyyy()}",
                    style: Get.textTheme.bodyText1?.copyWith(
                      fontFamily: AppFont.medium,
                      color: AppColor.dark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rp ${controller.transaction?.amount?.toCurrency()}",
                    style: Get.textTheme.headline1?.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // PaidTypeChip(
                  //   paidSlug: controller.transaction?.isPaid == true ? "paid" : "due",
                  //   title: controller.iuran?.isPaid == true
                  //       ? "Lunas"
                  //       : "Belum Lunas",
                  // ),
                  // Visibility(
                  //   visible: controller.iuran?.paidAt != null,
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       const SizedBox(height: 8),
                  //       Text(
                  //         "Dibayarkan pada ${controller.iuran?.paidAt?.toDisplayDateAlt()}",
                  //         style: Get.textTheme.bodyText2?.copyWith(
                  //           color: AppColor.gray,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Informasi Desa"),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColor.light,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Desa ${controller.desa?.name}",
                            style: Get.textTheme.headline5
                                ?.copyWith(color: AppColor.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Kec. ${controller.desa?.district}, Kab. ${controller.desa?.city}\n${controller.desa?.province}",
                            style: Get.textTheme.bodyText2
                                ?.copyWith(color: AppColor.gray),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButtonLocation(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.desa?.iurans?.length ?? 0,
                  itemBuilder: (ctx, index) => IuranByDesaItem(
                    data: controller.desa?.iurans?[index] ?? IuranDesa(),
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(width: 24),
                ),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Metode Pembayaran"),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.desa?.payments?.length ?? 0,
                itemBuilder: (ctx, index) => IuranMetodePembayaranItem(
                  data:
                      controller.desa?.payments?[index] ?? DesaPaymentMethod(),
                ),
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Penanggung Jawab"),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.desa?.stakeholders?.length ?? 0,
                itemBuilder: (ctx, index) => PengurusDesaListItem(
                  data: controller.desa?.stakeholders?[index] ??
                      DesaStakeholder(),
                  onPressed: (value) {},
                ),
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: AppFillButton(
            text: "Bayar",
            onPressed: () {},
          ),
        ),
      );
    });
  }
}
