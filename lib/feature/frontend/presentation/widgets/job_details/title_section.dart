import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobDetailsTitleSection extends StatelessWidget {
  const JobDetailsTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(
      builder: (controller) {
        final model = controller.jobDetailsModel;
        final data = model?.data;
        final job = data?.job;
        return CustomContainer(borderRadius: 5,
          child: Column(spacing: Dimensions.paddingSizeSmall,
              crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(job?.company?.name??'N/A', style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
                Text(job?.jobTitle??'N/A', style: textSemiBold.copyWith(
                  color: systemPrimaryColor(),
                    fontSize: Dimensions.fontSizeExtraLarge)),
                Row(spacing: Dimensions.paddingSizeDefault, children: [
                  if(job?.jobExpiryDate != null)
                  Expanded(child: Text("${"application_deadline".tr} : "
                      "${DateConverter.quotationDateAndTime(DateTime.parse(job?.jobExpiryDate??''))}")),
                  IntrinsicWidth(child: CustomButton(onTap: (){
                    if(Get.find<AuthenticationController>().loggedIn()){
                      Get.toNamed(RouteHelper.getJobApplyRoute());
                    }else{
                      Get.toNamed(RouteHelper.getLoginRoute());
                    }
                  }, text: "apply_now".tr)),



                  IntrinsicWidth(
                      child: CustomButton(
                          buttonColor: Theme.of(context).cardColor,
                          borderColor: Theme.of(context).hintColor,
                          textColor: Theme.of(context).textTheme.displayLarge!.color!,
                          onTap: (){

                          },
                          text: "share".tr, icon: Row(spacing: Dimensions.paddingSizeSmall, children: [
                            FaIcon(FontAwesomeIcons.facebook, size: 20,),
                            FaIcon(FontAwesomeIcons.linkedin, size: 20,),
                            FaIcon(FontAwesomeIcons.whatsapp, size: 20,),
                          ]))),
                ])

              ]),
        );
      }
    );
  }
}
