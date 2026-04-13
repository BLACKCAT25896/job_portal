import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class FeatureMenuItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function()? onTap;
  const FeatureMenuItemWidget({super.key, required this.title, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,
        showShadow: false, borderRadius: Dimensions.paddingSizeExtraSmall,
        horizontalPadding: Dimensions.paddingSizeDefault,
        verticalPadding: Dimensions.paddingSizeSmall, color: Theme.of(context).cardColor,
        child: Row(spacing: Dimensions.paddingSizeSmall, children: [
      CustomImage(isLocalAsset: true, image: imageUrl, width: 25, height: 25),
      Text(title, style:  textMedium.copyWith())
    ]));
  }
}
