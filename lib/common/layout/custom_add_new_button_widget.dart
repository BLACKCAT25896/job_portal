import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/styles.dart';


class CustomAddNewButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const CustomAddNewButtonWidget({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,
        verticalPadding: 5, borderRadius: 5, color: systemPrimaryColor(),
        child: Text(title?? '', style: textRegular.copyWith(color: Colors.white)));
  }
}


class PosButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final bool isSelected;
  const PosButtonWidget({super.key, this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,showShadow: false,
        verticalPadding: 5, borderRadius: 5, color: isSelected? systemPrimaryColor(): Colors.transparent,
        child: Text(title?? '', style: textRegular.copyWith(color: isSelected ?Colors.white: null)));
  }
}