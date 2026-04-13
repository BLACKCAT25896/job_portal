import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class RegistrationTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const RegistrationTitle({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: AppBar().preferredSize.height),
      Center(child: Text(title?? "start_your_business".tr, style: textMedium.copyWith(fontSize: Get.width * .08))),
      Center(child: Text(subtitle?? "start_business_message".tr, style: textRegular.copyWith())),
      const SizedBox(height: Dimensions.paddingSizeDefault),
    ],);
  }
}
