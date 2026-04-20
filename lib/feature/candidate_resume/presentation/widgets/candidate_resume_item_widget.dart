import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/widgets/add_new_candidate_resume_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CandidateResumeItemWidget extends StatelessWidget {
  final CandidateResumeItem? candidateResumeItem;
  final int index;
  const CandidateResumeItemWidget({super.key, this.candidateResumeItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomItemTextWidget(text:'${candidateResumeItem?.title}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateResumeItem?.fileName}${candidateResumeItem?.type}')),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "candidate_resume", onTap: (){
            Get.back();
            Get.find<CandidateResumeController>().deleteCandidateResume((candidateResumeItem!.id!));
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "candidate_resume".tr,
            child: AddNewCandidateResumeWidget(candidateResumeItem: candidateResumeItem)));
      },)
    ],
    );
  }
}