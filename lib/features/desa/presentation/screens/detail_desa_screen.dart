import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/desa/presentation/widgets/info_desa_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/kegiatan_desa_grid_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/pengurus_desa_list_item.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';

final List<InfoDesa> infoDesa = [
  InfoDesa(
    title: "Warga",
    value: 234.toString(),
    icon: "assets/icons/ic_warga.svg",
  ),
  InfoDesa(
    title: "Luas Wilayah",
    value: "123m\u00B2",
    icon: "assets/icons/ic_wilayah.svg",
  ),
  InfoDesa(
    title: "Kode Pos",
    value: "51189",
    icon: "assets/icons/ic_kode_pos.svg",
  ),
];

class DetailDesaScreen extends StatelessWidget {
  const DetailDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          physics: const BouncingScrollPhysics(),
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
                    width: 24,
                    height: 24,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "Detail Desa",
                  style:
                      Get.textTheme.headline4?.copyWith(color: AppColor.black),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Desa Karangtengah",
              style: Get.textTheme.headline3?.copyWith(
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Kelurahan Jati Asih, Kec. Payabungkuh\nKab. Bekasi, Jawa Bart",
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
              children: infoDesa.map(
                (info) {
                  return Expanded(
                    child: InfoDesaItem(info: info),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 32),
            const SectionSubtitle(subtitle: "Kegiatan Desa"),
            const SizedBox(height: 16),
            SizedBox(
              height: 136,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx, index) {
                  return KegiatanDesaGridItem(
                    onPressed: () {},
                  );
                },
                separatorBuilder: (ctx, index) => const SizedBox(width: 16),
              ),
            ),
            const SizedBox(height: 32),
            const SectionSubtitle(subtitle: "Kepengurusan Desa"),
            const SizedBox(height: 16),
            ...List.generate(
              4,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PengurusDesaListItem(
                    onPressed: () {},
                  ),
                  index == 9
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 16)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
