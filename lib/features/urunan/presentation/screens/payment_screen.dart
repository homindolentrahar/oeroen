import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

class PaymentScreen extends StatefulWidget {
  static const route = "/payment";
  final UrunanItem item;

  const PaymentScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _selectedMethod = 0;

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
                  Text(
                    "Bayar Urunan ${widget.item.type.name}",
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontFamily: AppFont.semiBold,
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pilih Metode Pembayaran",
                        style: TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 192,
                        child: ListView.builder(
                          itemCount: paymentMethods.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        paymentMethods[index].image,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            paymentMethods[index].name,
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 16,
                                              fontFamily: AppFont.semiBold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            paymentMethods[index].account,
                                            style: const TextStyle(
                                              color: AppColor.gray,
                                              fontSize: 10,
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
                                      ).format(
                                        paymentMethods[index].balance,
                                      ),
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontFamily: AppFont.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    _selectedMethod == index
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(360),
                                            child: SvgPicture.asset(
                                              "assets/icons/success.svg",
                                              width: 16,
                                              height: 16,
                                            ),
                                          )
                                        : Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              color: AppColor.darker,
                                              borderRadius:
                                                  BorderRadius.circular(360),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                        "Penanggung Jawab",
                        style: TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.primary, width: 2),
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Image.asset(
                              "assets/images/admin.png",
                              width: 48,
                              height: 48,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
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
                                    color: AppColor.gray,
                                    fontSize: 12,
                                    fontFamily: AppFont.medium,
                                  ),
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
                              "Hubungi",
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
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Catatan",
                        style: TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: "notes",
                        keyboardType: TextInputType.emailAddress,
                        minLines: 4,
                        maxLines: 8,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.medium,
                        ),
                        decoration: InputDecoration(
                          hintText: "Berikan catatan pembayaran",
                          hintStyle: const TextStyle(
                            color: AppColor.gray,
                            fontSize: 14,
                            fontFamily: AppFont.regular,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: AppColor.primary),
                          ),
                          filled: true,
                          fillColor: AppColor.darker,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
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
          onPressed: widget.item.completed ? null : () {},
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                NumberFormat.currency(symbol: "Rp ", decimalDigits: 0)
                    .format(widget.item.amount),
                style: TextStyle(
                  color:
                      widget.item.completed ? AppColor.light : AppColor.black,
                  fontSize: 20,
                  fontFamily: AppFont.bold,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/money.svg",
                color: widget.item.completed ? AppColor.light : AppColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
