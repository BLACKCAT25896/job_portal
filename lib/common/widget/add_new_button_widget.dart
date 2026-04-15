import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class AddNewButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  const AddNewButtonWidget({super.key, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,
    color: systemPrimaryColor(), verticalPadding: 8, borderRadius: 3,
    child: Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
    Icon(Icons.add, color: Colors.white, size: Dimensions.iconSizeSmall),
    Text(title??"enroll_in_a_new_course".tr,
        style: textRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall)),
    ]));
  }
}