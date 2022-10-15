import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/data/urunan_data.dart';
import 'package:oeroen/features/urunan/presentation/widgets/active_urunan_item.dart';
import 'package:oeroen/features/urunan/presentation/widgets/urunan_list_item.dart';
import 'package:oeroen/presentation/widgets/app_icon_button.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaFragment extends StatelessWidget {
  const BerandaFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Juli 2022",
              style: TextStyle(
                color: AppColor.white,
                fontFamily: AppFont.semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              "assets/icons/caret_down.svg",
              color: AppColor.white,
              height: 20,
              width: 20,
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Urunanku",
                    style: TextStyle(
                      color: AppColor.white,
                      fontFamily: AppFont.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "Kamu memiliki ",
                        ),
                        TextSpan(
                          text: "3 urunan",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                        TextSpan(
                          text: " yang harus dibayarkan",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            AppIconButton(
              icon: "assets/icons/notification.svg",
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: activeUrunan.length,
            itemBuilder: (ctx, index) {
              return ActiveUrunanItem(
                item: activeUrunan[index],
                onPressed: (item) {
                  debugPrint("${item.id} clicked!");

                  Get.toNamed(AppRoute.urunanRoute);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.darker,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: typeIcons.entries
                .map(
                  (entry) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        entry.value,
                        color: typeColors[entry.key],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        entry.key.name,
                        style: TextStyle(
                          color: typeColors[entry.key],
                          fontSize: 12,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 32),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transaksi Terakhir",
                  style: TextStyle(
                    color: AppColor.light,
                    fontFamily: AppFont.semiBold,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 14,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 320,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: activeUrunan.length,
                itemBuilder: (ctx, index) {
                  return UrunanListItem(
                    item: activeUrunan[index],
                    onPressed: (item) {
                      debugPrint("${item.id} clicked!");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
