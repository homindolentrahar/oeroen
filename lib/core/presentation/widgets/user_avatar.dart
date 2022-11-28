import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/image_load.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.imageUrl,
    required this.items,
  }) : super(key: key);

  final String? imageUrl;
  final List<PopupMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColor.white,
      position: PopupMenuPosition.under,
      offset: const Offset(5, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      itemBuilder: (context) => items,
      child: ImageLoad(
        width: 48,
        height: 48,
        radius: 360,
        image: imageUrl,
      ),
    );
  }
}
