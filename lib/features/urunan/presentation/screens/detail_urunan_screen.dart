import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/data/urunan_data.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';
import 'package:oeroen/features/urunan/presentation/widgets/payment_method_item.dart';
import 'package:oeroen/features/urunan/presentation/widgets/urunan_list_item.dart';
import 'package:oeroen/routes/app_routes.dart';

class DetailUrunanScreen extends StatefulWidget {
  static const route = "/detail-urunan";
  final UrunanItem item;

  const DetailUrunanScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailUrunanScreen> createState() => _DetailUrunanScreenState();
}

class _DetailUrunanScreenState extends State<DetailUrunanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.navigateBack();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/back.svg",
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Urunan ${widget.item.type.name}",
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontFamily: AppFont.semiBold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(
                    "assets/icons/info.svg",
                    color: AppColor.white,
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                decimalDigits: 0,
                                symbol: "Rp ",
                                name: "IDR",
                              ).format(widget.item.amount),
                              style: const TextStyle(
                                color: AppColor.white,
                                fontFamily: AppFont.bold,
                                fontSize: 36,
                              ),
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: AppColor.light,
                                  fontSize: 12,
                                  fontFamily: AppFont.medium,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Periode ",
                                  ),
                                  TextSpan(
                                      text: "Juli 2022",
                                      style: TextStyle(
                                        fontFamily: AppFont.bold,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (widget.item.completed
                                  ? AppColor.green
                                  : AppColor.red)
                              .withOpacity(0.25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.item.completed ? "Lunas" : "Belum Lunas",
                          style: TextStyle(
                            color: widget.item.completed
                                ? AppColor.green_fg
                                : AppColor.red_fg,
                            fontSize: 12,
                            fontFamily: AppFont.bold,
                          ),
                        ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        "Desa Wates, Kec. Depok, Kabupaten Sleman, Yogyakarta",
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
                    ],
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
                        height: 120,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 6 / 2,
                          ),
                          itemCount: paymentMethods.length,
                          itemBuilder: (ctx, index) {
                            return PaymentMethodItem(
                              item: paymentMethods[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Riwayat Urunan ${widget.item.type.name}",
                        style: const TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.semiBold,
                        ),
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
                              onPressed: (item) {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: MaterialButton(
          color: AppColor.green,
          disabledColor: AppColor.dark,
          padding: const EdgeInsets.all(32),
          elevation: 0,
          highlightElevation: 0,
          onPressed: widget.item.completed
              ? null
              : () {
                  context.router.push(PaymentRoute(item: widget.item));
                },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bayar",
                style: TextStyle(
                  color:
                      widget.item.completed ? AppColor.light : AppColor.black,
                  fontSize: 20,
                  fontFamily: AppFont.bold,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/arrow_right.svg",
                color: widget.item.completed ? AppColor.light : AppColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
