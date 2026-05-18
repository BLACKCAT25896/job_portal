import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/edit_career_and_application_informaton.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CareenAndApplicationWidget extends StatelessWidget {
  const CareenAndApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(builder: (controller) {
      return GetBuilder<ProfileController>(builder: (profileController) {
        final data = profileController.profileModel?.data;
        final candidate = data?.candidateInfo;
        if(candidate == null) return Container();
        return CustomExpandCollapse(
            isExpanded: controller.isExpanded("career_and_application"),
            onChanged: (v) => controller.toggleSection("career_and_application"),
            header: Text("career_and_application".tr, style: sectionHeadingTextStyle(context)),
            trailing: CustomIconTextButton(text: "edit".tr,onTap: (){
              Get.dialog(CustomDialogWidget(width: 900,
                  title: "career_and_application".tr,
                  child: const EditCareenAndApplicationWidget()));

              }, icon: Images.edit),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimensions.paddingSizeDefault, children: [
                    CandidateDetailItem(title: "objective".tr,
                        value: candidate.careerObject??"-"),
                    CandidateDetailItem(title: "present_salary".tr,
                        value: candidate.currentSalary??"-"),
                    CandidateDetailItem(title: "expected_salary".tr,
                        value: candidate.expectedSalary??"-"),
                    CandidateDetailItem(title: "looking_for_job_level".tr,
                        value: candidate.lookingFor??"-"),
                    CandidateDetailItem(title: "available_for".tr,
                        value: candidate.availableFor??"-"),
                  ],
                ));
          }
        );
      }
    );
  }
}
