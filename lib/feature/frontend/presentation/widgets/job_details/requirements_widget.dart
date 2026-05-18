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


                  Text("responsibilities_and_context".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.responsibilities??"-",style: textRegular),


                  if(job?.skills?.isNotEmpty == true)
                    Text("skills_and_expertise".tr, style: textSemiBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge)),
                  if(job?.skills?.isNotEmpty == true)
                    Wrap(spacing: Dimensions.paddingSizeSmall,
                      runSpacing: Dimensions.paddingSizeSmall,
                      children: List.generate(job?.skills?.length ?? 0, (index) {
                          return Row(mainAxisSize: MainAxisSize.min,
                            spacing: Dimensions.fontSizeExtraSmall, children: [
                              CustomContainer(borderRadius: 150, verticalPadding: 3,
                                showShadow: false, border: Border.all(color: systemPrimaryColor(), width: .5),
                                horizontalPadding: Dimensions.paddingSizeSmall,
                                child:  Text(job?.skills?[index].name ?? '-',
                                  style: textRegular)),

                            ],
                          );
                        },
                      ),
                    ),



                  if(job?.benefits?.isNotEmpty == true)
                  Text("compansion_and_other_benefit".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  if(job?.benefits?.isNotEmpty == true)
                  ListView.separated(shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (_,index){
                    return Row(spacing: Dimensions.fontSizeExtraSmall,
                      children: [
                        CustomContainer(horizontalPadding: 5, verticalPadding: 5,
                            color: systemPrimaryColor()),
                        Text(job?.benefits?[index].name??'-',style: textRegular),
                      ],
                    );
                  },
                      separatorBuilder: (_, index){
                    return SizedBox(height: Dimensions.paddingSizeSmall);
                      }, itemCount: job?.benefits?.length??0),

                  Text("workplace".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.workplace??'-',style: textRegular),


                  Text("employment_status".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.employmentType??"-",style: textRegular),


                  Text("job_location".tr, style: textSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge)),
                  Text(job?.address?? 'Anywhere in world',style: textRegular),



                ]));
      }
    );
  }
}
