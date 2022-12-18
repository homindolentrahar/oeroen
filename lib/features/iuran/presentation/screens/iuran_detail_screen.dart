import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/icon_button_location.dart';
import 'package:oeroen/core/presentation/widgets/paid_type_chip.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_detail_controller.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_metode_pembayaran_item.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';

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
                title: controller.title,
                backEnabled: true,
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Periode Mei 2022",
                    style: Get.textTheme.bodyText1?.copyWith(
                      fontFamily: AppFont.medium,
                      color: AppColor.dark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rp 46,750",
                    style: Get.textTheme.headline1?.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PaidTypeChip(
                    paidSlug: "paid",
                    title: "Lunas",
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Dibayarkan pada 14:50, 15 Mei 2022",
                    style: Get.textTheme.bodyText2?.copyWith(
                      color: AppColor.gray,
                    ),
                  ),
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
                            "Desa Karangtengah",
                            style: Get.textTheme.headline5
                                ?.copyWith(color: AppColor.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Kelurahan Jati Asih, Kec. Payabungkuh\nKab. Bekasi, Jawa Bart",
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
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
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
                            "assets/icons/ic_keamanan.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Keamanan",
                          style: Get.textTheme.bodyText2?.copyWith(
                            color: AppColor.dark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "25,000",
                          style: Get.textTheme.caption?.copyWith(
                            color: AppColor.black,
                            fontFamily: AppFont.semiBold,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) => const SizedBox(width: 24),
                ),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Metode Pembayaran"),
              const SizedBox(height: 16),
              ...List.generate(
                3,
                (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const IuranMetodePembayaranItem(),
                    index == 2
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 16)
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Penanggung Jawab"),
              const SizedBox(height: 16),
              // ...List.generate(
              //   4,
              //   (index) => Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       PengurusDesaListItem(
              //         onPressed: () {},
              //       ),
              //       index == 3
              //           ? const SizedBox.shrink()
              //           : const SizedBox(height: 16)
              //     ],
              //   ),
              // ),
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
