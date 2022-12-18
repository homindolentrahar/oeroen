import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/icon_button_location.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/routes/app_route.dart';

class InfoDesaBanner extends StatelessWidget {
  const InfoDesaBanner({Key? key, required this.data}) : super(key: key);

  final Desa data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColor.light,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? "",
                      style: Get.textTheme.headline4
                          ?.copyWith(color: AppColor.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Kec. ${data.district}, ${data.city}\nProvinsi ${data.province}",
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: AppColor.gray),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              IconButtonLocation(onPressed: () {}),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: AppColor.gray.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_person.svg",
                    color: AppColor.gray,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${data.population} Warga",
                    style: Get.textTheme.bodyText2?.copyWith(
                      color: AppColor.gray,
                      fontFamily: AppFont.medium,
                    ),
                  ),
                ],
              ),
              AppTextButton(
                text: "Selengkapnya",
                textSize: 12,
                onPressed: () {
                  Get.toNamed(
                    "${AppRoute.mainDesaRoute}/${Constants.dummyDesaId}",
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
