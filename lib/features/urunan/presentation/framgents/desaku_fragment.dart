import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/data/urunan_data.dart';
import 'package:oeroen/features/urunan/presentation/widgets/urunan_list_item.dart';
import 'package:oeroen/presentation/widgets/app_icon_button.dart';

class DesakuFragment extends StatefulWidget {
  const DesakuFragment({Key? key}) : super(key: key);

  @override
  State<DesakuFragment> createState() => _DesakuFragmentState();
}

class _DesakuFragmentState extends State<DesakuFragment> {
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
                children: const [
                  Text(
                    "Desaku",
                    style: TextStyle(
                      color: AppColor.white,
                      fontFamily: AppFont.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Wates Gg. 14, No. 872\nRT 013/ RW 029, 57724",
                    style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 12,
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: const AssetImage(
                "assets/images/map.png",
              ),
              colorFilter: ColorFilter.mode(
                AppColor.black.withOpacity(0.15),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Alamat",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 10,
                        fontFamily: AppFont.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Desa Wates",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Kec. Depok, Kabupaten Sleman\nYogyakarta",
                          style: TextStyle(
                            color: AppColor.light,
                            fontSize: 12,
                            fontFamily: AppFont.medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              MaterialButton(
                minWidth: 0,
                height: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                highlightElevation: 0,
                color: AppColor.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: const Text(
                  "Ganti",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 12,
                    fontFamily: AppFont.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Urunan Bulanan",
              style: TextStyle(
                color: AppColor.light,
                fontSize: 14,
                fontFamily: AppFont.semiBold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: activeUrunan.length,
                itemBuilder: (ctx, index) {
                  final item = activeUrunan[index];

                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Material(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        splashColor: AppColor.light.withOpacity(0.25),
                        highlightColor: AppColor.light.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColor.primary.withOpacity(0.15),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                typeIcons[item.type].toString(),
                                color: typeColors[item.type],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                NumberFormat.currency(
                                  decimalDigits: 0,
                                  symbol: "",
                                ).format(item.amount),
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontFamily: AppFont.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.type.name,
                                style: const TextStyle(
                                  color: AppColor.light,
                                  fontSize: 12,
                                  fontFamily: AppFont.medium,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
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
                        "Dana Terkumpul",
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
                        ).format(32450000),
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
        ),
      ],
    );
  }
}
