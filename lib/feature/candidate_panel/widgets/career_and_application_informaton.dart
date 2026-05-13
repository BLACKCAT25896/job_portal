import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CareenAndApplicationWidget extends StatelessWidget {
  const CareenAndApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(
      builder: (controller) {
        return CustomExpandCollapse(
            isExpanded: controller.isExpanded("career_and_application"),
            onChanged: (v) => controller.toggleSection("career_and_application"),
            header: Text("career_and_application".tr,
            style: sectionHeadingTextStyle(context)),
            trailing: CustomIconTextButton(text: "edit".tr,onTap: (){}, icon: Images.edit),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeDefault, children: [
                CandidateDetailItem(title: "objective".tr, value: "As a passionate and experienced Flutter developer, Aim to leverage my skills in cross-platform mobile application development to create innovative and user-friendly apps that enhance user experiences and drive business success."),
                CandidateDetailItem(title: "present_salary".tr, value: "88888"),
                CandidateDetailItem(title: "expected_salary".tr, value: "88888"),
                CandidateDetailItem(title: "looking_for_job_level".tr, value: "Top Level"),
                CandidateDetailItem(title: "available_for".tr, value: "Full Time"),
              ],
            ));
      }
    );
  }
}
