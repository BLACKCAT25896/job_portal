import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class RequirementsWidget extends StatelessWidget {
  const RequirementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(
      builder: (controller) {
        final job = controller.jobDetailsModel?.data?.job;

        return CustomContainer(borderRadius: 5,width: Dimensions.webMaxWidth,
            child: Column(spacing: Dimensions.paddingSizeDefault,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("requirements".tr, style: textBold.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                  Text("education".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.educationDetail??'N/A',style: textRegular),

                  Text("experience".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("${job?.minExperience??0}-${job?.maxExperience??0} years",style: textRegular),

                  Text("additional_requirement".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("N/A",style: textRegular),


                  Text("responsibilities_and_context".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("N/A",style: textRegular),

                  Text("compansion_and_other_benefit".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("N/A",style: textRegular),

                  Text("workplace".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("N/A",style: textRegular),


                  Text("employment_status".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text("Full Time",style: textRegular),


                  Text("job_location".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.company?.location?? 'Anywhere in world',style: textRegular),



                ]));
      }
    );
  }
}
