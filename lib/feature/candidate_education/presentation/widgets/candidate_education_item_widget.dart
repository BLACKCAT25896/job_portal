import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:mighty_job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CandidateEducationItemWidget extends StatelessWidget {
  final CandidateEducationItem? candidateEducationItem;
  final int index;
  const CandidateEducationItemWidget({super.key, this.candidateEducationItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomItemTextWidget(text:'${candidateEducationItem?.status}')),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "candidate_education", onTap: (){
            Get.back();
            Get.find<CandidateEducationController>().deleteCandidateEducation((candidateEducationItem!.id!));
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "candidate_education".tr,
            child: AddNewCandidateEducationWidget(candidateEducationItem: candidateEducationItem)));
      },)
    ],
    );
  }
}