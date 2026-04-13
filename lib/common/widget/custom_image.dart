import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../util/images.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;
  final String placeholder;
  final String? svgAssetPath;
  final bool? isCircular;
  final bool isLoading;
  final bool showLoader;
  final bool showTapToImageView;
  final bool isLocalAsset;
  final Color? svgColor;

  const CustomImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder = Images.placeholder,
    this.radius = 0,
    this.svgAssetPath,
    this.isCircular,
    this.isLoading = false,
    this.showLoader = true,
    this.showTapToImageView = false,
    this.isLocalAsset = false,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    final placeholderWidget = Image.asset(placeholder, height: height, width: width, fit: BoxFit.cover);

    if (isLocalAsset) {
      return ClipRRect(borderRadius: BorderRadius.circular(radius),
        child: Image.asset(image!, height: height, width: width,
          fit: fit, color: svgColor,));
    }


    if (svgAssetPath != null) {
      return SvgPicture.asset(svgAssetPath!, height: height, width: width, fit: fit,
      colorFilter: svgColor != null?
      ColorFilter.mode(svgColor!, BlendMode.srcIn): null);
    }


    if (image != null) {
      return ClipRRect(borderRadius: BorderRadius.circular(isCircular == true ? (height ?? 0) / 2 : radius),
        child: FadeInImage.assetNetwork(placeholder: Images.placeholder, image: image ?? '', height: height, width: width, fit: fit,
          imageErrorBuilder: (context, error, stackTrace) {
            return placeholderWidget;
          },
          fadeInDuration: const Duration(milliseconds: 200), // Customize fade-in duration.
          fadeOutDuration: const Duration(milliseconds: 200)),
      );
    }
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: placeholderWidget);
  }
}
