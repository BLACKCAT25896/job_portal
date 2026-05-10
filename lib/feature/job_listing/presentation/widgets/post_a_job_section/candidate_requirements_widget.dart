import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/authentication/presentation/widgets/gender_selection_widget.dart';
import 'package:job/feature/degree_level/presentation/widgets/select_degree_level_widget.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/skill/presentation/widgets/select_skill_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';

class CandidateRequirementsWidget extends StatefulWidget {
  const CandidateRequirementsWidget({super.key});

  @override
  State<CandidateRequirementsWidget> createState() => _CandidateRequirementsWidgetState();
}

class _CandidateRequirementsWidgetState extends State<CandidateRequirementsWidget> {

  TextEditingController minimumAgeController = TextEditingController();
  TextEditingController maximumAgeController = TextEditingController();
  TextEditingController additionalRequirementsController = TextEditingController();
  TextEditingController educationDetailsController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return CustomContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("candidate_requirements".tr),
        GenderSelectionWidget(),
        ResponsiveMasonryGrid(children: [


          CustomTextField(
            title: "minimum_age".tr,
            hintText: "minimum_age".tr,
            controller: minimumAgeController,
            inputFormatters: [AppConstants.numberFormat],
            inputType: TextInputType.number,
          ),
          CustomTextField(
            title: "maximum_age".tr,
            hintText: "maximum_age".tr,
            controller: maximumAgeController,
            inputFormatters: [AppConstants.numberFormat],
            inputType: TextInputType.number,
          )
        ]),

        SelectDegreeLevelWidget(),
        CustomTextField(
          title: "education_detail".tr,
          hintText: "education_detail".tr,
          controller: educationDetailsController,
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline,
        ),

        SelectSkillWidget(),
        CustomTextField(
          title: "additional_requirement".tr,
          hintText: "additional_requirement".tr,
          controller: additionalRequirementsController,
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline,
        ),

        CustomContainer(showShadow: false, borderRadius: 5,
          verticalPadding: 20,
          color: systemPrimaryColor().withValues(alpha: .125),
          child: Align(alignment: Alignment.centerRight,
              child: SizedBox(width: 150,
                child: CustomButton(onTap: (){
                  Get.find<JobListingController>().selectStep(2);
                }, text: "continue".tr),
              )),)


      ])
    );
  }
}
