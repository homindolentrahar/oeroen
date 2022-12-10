import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/presentation/application/desa_detail_controller.dart';
import 'package:oeroen/features/desa/presentation/widgets/info_desa_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/kegiatan_desa_grid_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/pengurus_desa_list_item.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';

class DesaDetailScreen extends StatelessWidget {
  const DesaDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: GetBuilder<DesaDetailController>(builder: (controller) {
          final List<InfoDesa> infoDesa = [
            InfoDesa(
              title: "Warga",
              value: controller.desa.population.toString(),
              icon: "assets/icons/ic_warga.svg",
            ),
            InfoDesa(
              title: "Luas Wilayah",
              value: "${controller.desa.area}m\u00B2",
              icon: "assets/icons/ic_wilayah.svg",
            ),
            InfoDesa(
              title: "Kode Pos",
              value: controller.desa.zipCode.toString(),
              icon: "assets/icons/ic_kode_pos.svg",
            ),
          ];

          return ListView(
            padding: const EdgeInsets.all(32),
            physics: const BouncingScrollPhysics(),
            children: [
              const CoreAppBar(
                title: "Detail Desa",
                backEnabled: true,
              ),
              const SizedBox(height: 32),
              Text(
                "Desa ${controller.desa.name}",
                style: Get.textTheme.headline3?.copyWith(
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Kec. ${controller.desa.district}, ${controller.desa.city}\nProvinsi ${controller.desa.province}",
                style: Get.textTheme.bodyText1?.copyWith(
                  color: AppColor.dark,
                ),
              ),
              const SizedBox(height: 32),
              AppFillButton(
                text: "Temukan",
                textSize: 14,
                icon: SvgPicture.asset(
                  "assets/icons/ic_location_white.svg",
                  color: AppColor.white,
                  width: 16,
                  height: 16,
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: infoDesa
                    .map((info) => Expanded(child: InfoDesaItem(info: info)))
                    .toList(),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Kegiatan Desa"),
              const SizedBox(height: 16),
              SizedBox(
                height: 176,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.desa.activities?.length ?? 0,
                  itemBuilder: (ctx, index) => KegiatanDesaGridItem(
                    activity:
                        controller.desa.activities?[index] ?? DesaActivity(),
                    onPressed: () {},
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(width: 16),
                ),
              ),
              const SizedBox(height: 32),
              const SectionSubtitle(subtitle: "Kepengurusan Desa"),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.desa.stakeholders?.length ?? 0,
                itemBuilder: (ctx, index) => PengurusDesaListItem(
                  data:
                      controller.desa.stakeholders?[index] ?? DesaStakeholder(),
                  onPressed: (data) {},
                ),
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
              ),
            ],
          );
        }),
      ),
    );
  }
}
