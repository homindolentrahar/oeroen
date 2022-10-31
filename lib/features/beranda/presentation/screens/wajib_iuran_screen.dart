import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/beranda/presentation/widgets/iuran_list_item.dart';

class WajibIuranScreen extends StatelessWidget {
  const WajibIuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Wajib Iuran",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontFamily: AppFont.semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: AppColor.black,
                    fontFamily: AppFont.semiBold,
                  ),
                  children: [
                    TextSpan(
                      text: "Rp ",
                      style: TextStyle(fontSize: 32),
                    ),
                    TextSpan(
                      text: "245.750",
                      style: TextStyle(fontSize: 48),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Periode Mei 2022",
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 14,
                  fontFamily: AppFont.regular,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: const [
                  Text(
                    "Rincian",
                    style: TextStyle(
                      color: AppColor.dark,
                      fontSize: 14,
                      fontFamily: AppFont.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return IuranListItem(
                      onPressed: () {},
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(height: 16);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
