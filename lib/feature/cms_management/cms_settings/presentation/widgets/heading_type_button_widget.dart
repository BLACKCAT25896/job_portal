import 'package:job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class HeadingTypeButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final bool selected;
  final String title;
  const HeadingTypeButtonWidget({super.key, this.onTap, this.selected = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child: CustomContainer(color: selected?
      systemPrimaryColor().withValues(alpha: .25) : Theme.of(context).hintColor,
          borderRadius: Dimensions.paddingSizeExtraSmall, showShadow: false, verticalPadding: 0,
        onTap: onTap,
        border: Border.all(color: selected? systemPrimaryColor() : Theme.of(context).hintColor),
        child:  Padding(padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeSmall,
            vertical: Dimensions.paddingSizeExtraSmall),
          child: Center(child: Text(title,
              style: textRegular.copyWith(color: selected?
              systemPrimaryColor() : null))))),
    );
  }
}
