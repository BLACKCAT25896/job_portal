import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class CompanyRegistrationHeadingWidget extends StatelessWidget {
  const CompanyRegistrationHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(showShadow: false, borderRadius: 5,
        verticalPadding: 20,horizontalPadding: Dimensions.paddingSizeDefault,
        color: systemPrimaryColor(),
        child: Row(spacing: Dimensions.paddingSizeDefault, children: [

          CustomContainer(color: Colors.white,
              child: CustomImage(width: 100, image: Images.company, isLocalAsset: true, svgColor: systemPrimaryColor(),)),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeSmall,
                children: [
                  Text("employee_registration_form".tr,
                      style: textSemiBold.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeExtraLarge)),

                  Text("create_your_account_to_reach_top_talent_and_streamline_hiring".tr,
                      style: textRegular.copyWith(color: Colors.white))
                ]),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "over".tr, style: textMedium.copyWith(
                color: Colors.white,
                fontSize: Dimensions.fontSizeLarge)),
            TextSpan(text: " ".tr),
            TextSpan(text: "45000+".tr, style: textSemiBold.copyWith(color: Colors.white,
                fontSize: Dimensions.fontSizeExtraLarge)),
            TextSpan(text: " ".tr),
            TextSpan(text: "companies_trusted_us".tr,  style: textMedium.copyWith(
                color: Colors.white,
                fontSize: Dimensions.fontSizeLarge)),
          ]))

        ]));
  }
}
