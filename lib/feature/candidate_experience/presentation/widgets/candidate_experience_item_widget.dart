import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CandidateExperienceItemWidget extends StatelessWidget {
  final CandidateExperienceItem? candidateExperienceItem;
  final int index;
  const CandidateExperienceItemWidget({super.key, this.candidateExperienceItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomItemTextWidget(text:'${candidateExperienceItem?.experienceTitle}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateExperienceItem?.company}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateExperienceItem?.startDate}')),
      Expanded(child: CustomItemTextWidget(text:candidateExperienceItem?.endDate??'N/A')),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "candidate_experience", onTap: (){
            Get.back();
            Get.find<CandidateExperienceController>().deleteCandidateExperience((candidateExperienceItem!.id!));
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "candidate_experience".tr,
            child: AddNewCandidateExperienceWidget(candidateExperienceItem: candidateExperienceItem)));
      },)
    ],
    );
  }
}