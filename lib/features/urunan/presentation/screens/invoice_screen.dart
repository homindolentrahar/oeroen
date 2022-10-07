import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/routes/app_route.dart';

class InvoiceScreen extends StatefulWidget {
  static const route = "/invoice";

  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoute.mainRoute);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close.svg",
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Pembayaran Berhasil",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: AppFont.semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: SvgPicture.asset(
                      "assets/icons/success.svg",
                      width: 48,
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Pembayaran Kamu Berhasil Dilakukan!",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 32,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Jangan lupa untuk membayar tepat waktu ya, agar layanan desa selalu optimal",
                    style: TextStyle(
                      color: AppColor.light,
                      fontFamily: AppFont.medium,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.darker,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            "assets/images/qr.svg",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "No. 1288717638",
                              style: TextStyle(
                                color: AppColor.light,
                                fontSize: 12,
                                fontFamily: AppFont.semiBold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Urunan Keamanan",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontFamily: AppFont.semiBold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat("dd MMMM yyyy, HH:mmm")
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                color: AppColor.light,
                                fontSize: 12,
                                fontFamily: AppFont.medium,
                              ),
                            ),
                          ],
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
                            "Salin",
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
                    const SizedBox(height: 16),
                    const Divider(
                      color: AppColor.gray,
                      indent: 8,
                      endIndent: 8,
                      thickness: 0.5,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              NumberFormat.currency(
                                symbol: "Rp ",
                                decimalDigits: 0,
                              ).format(25000),
                              style: const TextStyle(
                                color: AppColor.white,
                                fontSize: 24,
                                fontFamily: AppFont.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              "Via",
                              style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 12,
                                fontFamily: AppFont.medium,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      paymentMethods[0].image,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        paymentMethods[0].name,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontFamily: AppFont.semiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        paymentMethods[0].account,
                                        style: const TextStyle(
                                          color: AppColor.gray,
                                          fontSize: 12,
                                          fontFamily: AppFont.medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Pengirim",
                                    style: TextStyle(
                                      color: AppColor.light,
                                      fontSize: 12,
                                      fontFamily: AppFont.medium,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Marsha Lenathea",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontFamily: AppFont.semiBold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "33261812283992",
                                    style: TextStyle(
                                      color: AppColor.light,
                                      fontSize: 12,
                                      fontFamily: AppFont.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Penerima",
                                    style: TextStyle(
                                      color: AppColor.light,
                                      fontSize: 12,
                                      fontFamily: AppFont.medium,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Maria Genoveva",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontFamily: AppFont.semiBold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Bendahara Desa",
                                    style: TextStyle(
                                      color: AppColor.light,
                                      fontSize: 12,
                                      fontFamily: AppFont.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Desa Wates, Kec. Depok, Kabupaten Sleman\nYogyakarta",
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
            ],
          ),
        ),
        bottomNavigationBar: MaterialButton(
          color: AppColor.green,
          disabledColor: AppColor.dark,
          padding: const EdgeInsets.all(32),
          elevation: 0,
          highlightElevation: 0,
          onPressed: () {
            Get.offAllNamed(AppRoute.mainRoute);
          },
          child: const Text(
            "Kembali ke Beranda",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
        ),
      ),
    );
  }
}
