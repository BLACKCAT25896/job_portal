import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/add_new_recruitment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class RecruitmentItemWidget extends StatelessWidget {
  final RecruitmentItem? recruitmentItem;
  final int index;
  const RecruitmentItemWidget({super.key, this.recruitmentItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:recruitmentItem?.title??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:'${recruitmentItem?.vacancyCount??'N/A'}',)),
      Expanded(child: CustomTextItemWidget(text:recruitmentItem?.description??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:recruitmentItem?.requirements??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:recruitmentItem?.departmentName??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:recruitmentItem?.designationTitle??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:'${recruitmentItem?.recruiterFirstName??'N/A'} ${recruitmentItem?.recruiterLastName??''}',)),

      ActiveInActiveWidget(active: recruitmentItem?.status == "open", onChanged: (val){
        updateStatus(value: val, id: recruitmentItem!.id!.toString(), type: "recruitment",
        onSuccess: () async {
          Get.find<RecruitmentController>().getRecruitmentList(1);
        });
      },),
      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "recruitment", content: "recruitment",
          onTap: (){
            Get.back();
            Get.find<RecruitmentController>().deleteRecruitment(recruitmentItem!.id!);
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "recruitment".tr,
            child: AddNewRecruitmentWidget(recruitmentItem: recruitmentItem)));
      },)
    ],
    );
  }
}