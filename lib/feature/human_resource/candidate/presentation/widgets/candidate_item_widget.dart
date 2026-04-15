import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/feature/human_resource/candidate/presentation/widgets/add_new_candidate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/human_resource/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class CandidateItemWidget extends StatelessWidget {
  final CandidateItem? candidateItem;
  final int index;
  const CandidateItemWidget({super.key, this.candidateItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text:'${candidateItem?.firstName} ${candidateItem?.lastName??''}',)),
      Expanded(child: CustomItemTextWidget(text:'${candidateItem?.email}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateItem?.phone}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateItem?.status}')),
      Expanded(child: CustomItemTextWidget(text:'${candidateItem?.notes}')),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "candidate", onTap: (){
            Get.back();
            Get.find<CandidateController>().deleteCandidate(int.parse(candidateItem!.id!));
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "candidate".tr,
            child: AddNewCandidateWidget(candidateItem: candidateItem)));
      },)
    ],
    );
  }
}