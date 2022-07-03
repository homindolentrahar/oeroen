import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/data/urunan_data.dart';
import 'package:oeroen/features/urunan/presentation/widgets/urunan_list_item.dart';
import 'package:oeroen/presentation/widgets/app_icon_button.dart';

class RiwayatFragment extends StatefulWidget {
  const RiwayatFragment({Key? key}) : super(key: key);

  @override
  State<RiwayatFragment> createState() => _RiwayatFragmentState();
}

class _RiwayatFragmentState extends State<RiwayatFragment> {
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
                    "Riwayatku",
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
                          text: "Kamu sudah berkontribusi dalam ",
                        ),
                        TextSpan(
                          text: "3 urunan",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                        TextSpan(
                          text: " bulan ini",
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
        Container(
          decoration: BoxDecoration(
            color: AppColor.darker,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  "assets/images/left_illust.svg",
                ),
              ),
              Positioned(
                right: 0,
                child: SvgPicture.asset(
                  "assets/images/right_illust.svg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Total Urunan",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 10,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        NumberFormat.currency(
                          decimalDigits: 0,
                          symbol: "",
                        ).format(450000),
                        style: const TextStyle(
                          color: AppColor.white,
                          fontFamily: AppFont.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Per tanggal 20 Mei 2022",
                        style: TextStyle(
                          color: AppColor.light,
                          fontSize: 12,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/chart.svg"),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: typeColors.entries
                      .map(
                        (entry) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: entry.value,
                                      borderRadius: BorderRadius.circular(360),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    entry.key.name,
                                    style: TextStyle(
                                      color: entry.value,
                                      fontSize: 12,
                                      fontFamily: AppFont.semiBold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "34%",
                                style: TextStyle(
                                  color: entry.value,
                                  fontSize: 12,
                                  fontFamily: AppFont.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
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
                  "Transaksi Desa",
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
        )
      ],
    );
  }
}
