import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_icon_button.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Profilku",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 24,
                  fontFamily: AppFont.bold,
                ),
              ),
              const SizedBox(width: 16),
              AppIconButton(
                icon: "assets/icons/notification.svg",
                onPressed: () {},
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                border: Border.all(color: AppColor.primary, width: 2),
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Marsha Lenathea",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: AppFont.semiBold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "33263228118292",
                    style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 12,
                      fontFamily: AppFont.medium,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
            AppIconButton(
              icon: "assets/icons/edit_profile.svg",
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 32),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alamatku",
              style: TextStyle(
                color: AppColor.light,
                fontSize: 14,
                fontFamily: AppFont.semiBold,
              ),
            ),
            const SizedBox(height: 16),
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
                          "Rumah Orang Tua",
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
                              "Wates Gg. 14 No. 872",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontFamily: AppFont.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Des Wates, Kec. Depok, Kabupaten Sleman, Yogyakarta",
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
            )
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/add.svg", color: AppColor.primary),
              const SizedBox(width: 8),
              const Text(
                "Tambah Alamat",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontFamily: AppFont.bold,
                ),
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
              "Metode Pembayaran",
              style: TextStyle(
                color: AppColor.light,
                fontSize: 14,
                fontFamily: AppFont.semiBold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: paymentMethods.length,
                itemBuilder: (ctx, index) {
                  final item = paymentMethods[index];

                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColor.darker,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          item.image,
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontFamily: AppFont.semiBold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.account,
                                style: const TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 12,
                                  fontFamily: AppFont.medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          NumberFormat.currency(
                            decimalDigits: 0,
                            symbol: "",
                          ).format(item.balance),
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/add.svg",
                      color: AppColor.primary),
                  const SizedBox(width: 8),
                  const Text(
                    "Tambah Alamat",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 14,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
