import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_chips.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';

class IuranListScreen extends StatelessWidget {
  final String title;

  const IuranListScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

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
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontFamily: AppFont.semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: IuranFilterChips(),
                  ),
                  const SizedBox(width: 16),
                  Material(
                    color: AppColor.light,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        // TODO: Show the selected filter besides the Sort button
                        final IuranFilter? filter = await Get.bottomSheet(
                          const IuranFilterSheet(),
                        );

                        if (filter != null) {}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/icons/ic_sort.svg",
                          width: 16,
                          height: 16,
                        ),
                      ),
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
