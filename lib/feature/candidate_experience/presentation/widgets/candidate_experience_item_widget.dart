
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateExperienceItemWidget extends StatelessWidget {
  final CandidateExperienceItem? candidateExperienceItem;
  final int index;
  const CandidateExperienceItemWidget({super.key, this.candidateExperienceItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(spacing: Dimensions.paddingSizeDefault, children: [
        Expanded(child: Text("${"experience".tr} ${index+1}",
          style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

        EditDeleteSection(isHorizontal: true, onDelete: (){
          Get.dialog(ConfirmationDialog(
            title: "experience", onTap: (){
            Get.back();
            Get.find<CandidateExperienceController>().deleteCandidateExperience((candidateExperienceItem!.id!));
          },));

        }, onEdit: (){
          Get.dialog(CustomDialogWidget(title: "experience".tr,
              child: AddNewCandidateExperienceWidget(candidateExperienceItem: candidateExperienceItem)));
        },)


      ]),
      ResponsiveMasonryGrid(children: [
        CandidateDetailItem(title: "company_name".tr,
            value:'${candidateExperienceItem?.companyName}'),

        CandidateDetailItem(title: "company_business".tr,
            value:candidateExperienceItem?.companyBusiness??'-'),

        CandidateDetailItem(title: "designation".tr,
            value:candidateExperienceItem?.designation??'-'),
        CandidateDetailItem(title: "department".tr,
            value:'${candidateExperienceItem?.department}'),

        CandidateDetailItem(title: "employment_period".tr,
            value:'${candidateExperienceItem?.startDate} to ${candidateExperienceItem?.endDate??'Present'}'),
        CandidateDetailItem(title: "responsibilities".tr,
            value:candidateExperienceItem?.responsibilities??'-'),
        CandidateDetailItem(title: "expertise_areas".tr,
            value: (candidateExperienceItem?.expertiseAreas??'')),

      ])
    ],
    );
  }
}