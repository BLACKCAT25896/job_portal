import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
      final job = controller.jobDetailsModel?.data?.job;

      return CustomContainer(borderRadius: 5,width: Dimensions.webMaxWidth,
            child: Column(spacing: Dimensions.paddingSizeDefault,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("company_info".tr, style: textBold.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                  Text("${job?.company?.name}", style: textRegular.copyWith()),

                  SizedBox(height: Dimensions.paddingSizeExtraSmall),
                  Text("address".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text("${job?.company?.location}", style: textRegular.copyWith()),

                ]));
      }
    );
  }
}
