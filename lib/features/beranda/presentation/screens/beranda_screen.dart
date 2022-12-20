import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/main_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/beranda/presentation/application/beranda_controller.dart';
import 'package:oeroen/features/beranda/presentation/widgets/wajib_iuran_banner.dart';
import 'package:oeroen/features/beranda/presentation/widgets/beranda_category.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BerandaController>(builder: (controller) {
      return ListView(
        padding: const EdgeInsets.all(32),
        physics: const BouncingScrollPhysics(),
        children: [
          const MainAppBar(title: "Beranda"),
          const SizedBox(height: 32),
          WajibIuranBanner(totalAmount: controller.activeAmount),
          const SizedBox(height: 32),
          const BerandaCategoryTiles(),
          const SizedBox(height: 32),
          SectionSubtitle(
            subtitle: "Pembayaran Terkini",
            onPressed: controller.activeIuran.isNotEmpty
                ? () {
                    Get.toNamed(
                      AppRoute.recentTransactionRoute,
                      arguments: {
                        "title": "Pembayaran Terkini",
                      },
                    );
                  }
                : null,
          ),
          const SizedBox(height: 16),
          controller.paidIuran.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => IuranListItem(
                    isTransaction: true,
                    data: controller.paidIuran[index],
                    onPressed: (data) {
                      Get.toNamed(
                        "${AppRoute.mainIuranRoute}/${data.id}",
                        parameters: {'desa_code': data.desaCode ?? ""},
                      );
                    },
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemCount: controller.paidIuran.take(8).length,
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
