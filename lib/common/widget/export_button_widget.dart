import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportButtonWidget extends StatelessWidget {
  final Function()? onTap;
  const ExportButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap, borderRadius: 5, verticalPadding: 10,
        child : Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
          SizedBox(width: 15, child: Image.asset(Images.downloadIcon)),
          Text("export".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
        ],));
  }
}
