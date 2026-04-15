import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/rating_bar.dart';
import 'package:mighty_job/feature/human_resource/interview/presentation/widgets/add_new_interview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:mighty_job/feature/human_resource/interview/domain/models/interview_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class InterviewItemWidget extends StatelessWidget {
  final InterviewItem? interviewItem;
  final int index;
  const InterviewItemWidget({super.key, this.interviewItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.candidateFirstName} ${interviewItem?.candidateLastName??''}')),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.recruitmentTitle}')),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.departmentName}')),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.interviewerName}')),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.interviewDate}')),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.feedback}')),
      Expanded(child: RatingBar(rating:interviewItem?.rating?.toDouble()??0)),
      Expanded(child: CustomTextItemWidget(text:'${interviewItem?.status}')),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "interview", content: "interview",
          onTap: (){
            Get.back();
            Get.find<InterviewController>().deleteInterview(interviewItem!.id!);
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "interview".tr,
            child: AddNewInterviewWidget(interviewItem: interviewItem)));
      },)
    ],
    );
  }
}