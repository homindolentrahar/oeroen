import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/beranda/presentation/application/wajib_iuran_controller.dart';
import 'package:oeroen/utils/extension/date_extensions.dart';
import 'package:oeroen/utils/extension/double_extensions.dart';

class WajibIuranScreen extends StatelessWidget {
  const WajibIuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WajibIuranController>(builder: (controller) {
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
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColor.black,
                      fontFamily: AppFont.semiBold,
                    ),
                    children: [
                      const TextSpan(
                        text: "Rp ",
                        style: TextStyle(fontSize: 32),
                      ),
                      TextSpan(
                        text: controller.activeAmount.toCurrency(),
                        style: const TextStyle(fontSize: 48),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Periode ${DateTime.now().toMMMyyyy()}",
                  style: const TextStyle(
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
                    itemCount: controller.activeIuran.length,
                    itemBuilder: (ctx, index) {
                      return IuranListItem(
                        data: controller.activeIuran[index],
                        onPressed: (data) {},
                      );
                    },
                    separatorBuilder: (ctx, index) =>
                        const SizedBox(height: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
