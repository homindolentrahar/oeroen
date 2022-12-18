import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoad extends StatefulWidget {
  const ImageLoad({
    Key? key,
    required this.image,
    this.placeholder,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.radius,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.height,
    this.width,
  })  : assert(
            (radius != null &&
                    (topLeftRadius == null &&
                        topRightRadius == null &&
                        bottomLeftRadius == null &&
                        bottomRightRadius == null)) ||
                (radius == null &&
                    (topLeftRadius != null ||
                        topRightRadius != null ||
                        bottomLeftRadius != null ||
                        bottomRightRadius != null)) ||
                (radius == null &&
                    (topLeftRadius == null ||
                        topRightRadius == null ||
                        bottomLeftRadius == null ||
                        bottomRightRadius == null)),
            "Provide either all radius, or individual radius only"),
        super(key: key);

  final String? image;
  final ImageProvider? placeholder;
  final BoxFit fit;
  final Widget? errorWidget;
  final double? radius;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? height;
  final double? width;

  @override
  State<ImageLoad> createState() => _ImageLoadState();
}

class _ImageLoadState extends State<ImageLoad> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.radius != null
            ? BorderRadius.circular(widget.radius ?? 10.0)
            : BorderRadius.only(
                topRight: Radius.circular(widget.topRightRadius ?? 0.0),
                topLeft: Radius.circular(widget.topLeftRadius ?? 0.0),
                bottomRight: Radius.circular(widget.bottomRightRadius ?? 0.0),
                bottomLeft: Radius.circular(widget.bottomLeftRadius ?? 0.0),
              ),
        child: (widget.image != null &&
                widget.image!.isNotEmpty &&
                widget.image != "null")
            ? getImageNetwork()
            : getPlaceholder(),
      ),
    );
  }

  Widget getImageNetwork() {
    return FadeInImage(
      image: widget.image != null
          ? CachedNetworkImageProvider(widget.image ?? "")
          : const AssetImage("assets/images/profile.png") as ImageProvider,
      fit: widget.fit,
      placeholder:
          widget.placeholder ?? const AssetImage("assets/images/profile.png"),
      imageErrorBuilder: (context, _, stackTrace) {
        return widget.errorWidget ?? getPlaceholder();
      },
    );
  }

  Image getPlaceholder() {
    return Image(
      image:
          widget.placeholder ?? const AssetImage("assets/images/profile.png"),
      fit: widget.fit,
    );
  }
}
