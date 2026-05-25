import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/job_apply_section/custom_cv_attach_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class JobAndCandidateInformationWidget extends StatelessWidget {
  const JobAndCandidateInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(child: GetBuilder<LandingPageController>(builder: (controller) {
      final model = controller.jobDetailsModel;
      final data = model?.data;
      final job = data?.job;

      return Column(crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.paddingSizeDefault, children: [
            Text(job?.company?.name??'N/A', style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
            Text(job?.title??'N/A', style: textSemiBold.copyWith(
                color: systemPrimaryColor(), fontSize: Dimensions.fontSizeExtraLarge)),

            CustomDivider(),
            GetBuilder<ProfileController>(
              initState: (val){
                if(Get.find<ProfileController>().profileModel == null){
                  Get.find<ProfileController>().getCandidateProfileInfo();
                }
              },
                builder: (controller) {
              final model = controller.profileModel;
              final data = model?.data;

              return Row(spacing: Dimensions.paddingSizeDefault, children: [
                CustomImage(width: 50,height: 50, radius: 120,
                    image: "${AppConstants.imageBaseUrl}/profile/${data?.image}"),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(data?.name??'N/A', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    ResponsiveMasonryGrid(children: [

                      Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                        Icon(Icons.email, size: 18, color: systemPrimaryColor()),
                        Text(data?.email??'N/A', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                      ]),


                      Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                        Icon(Icons.phone, size: 18, color: systemPrimaryColor()),
                        Text(data?.phone??'N/A', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                      ]),
                    ])
                  ])),

                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  CustomImage(width: 20, height: 20, image:Images.edit, isLocalAsset: true),
                  Text("edit".tr, style: textRegular.copyWith(color: systemPrimaryColor()))
                ])
              ]);
            }),


            CustomTextField(
                controller: controller.monthlySalaryController,
                hintText: "e.g. 50000",
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
                isAmount: true,
                title: "your_expected_salary_monthly".tr),

            CustomCvAttachWidget(),

              ]);
        }
    ));
  }
}
