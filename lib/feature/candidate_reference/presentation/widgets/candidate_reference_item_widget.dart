
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_model.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/add_new_candidate_reference_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateReferenceItemWidget extends StatelessWidget {
  final CandidateReferenceItem? candidateReferenceItem;
  final int index;
  const CandidateReferenceItemWidget({super.key, this.candidateReferenceItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Text("${"reference".tr} ${index+1}",
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

          EditDeleteSection(isHorizontal: true, onDelete: (){
            Get.dialog(ConfirmationDialog(
              title: "reference", onTap: (){
              Get.back();
              Get.find<CandidateReferenceController>().deleteCandidateReference((candidateReferenceItem!.id!));
            },));

          }, onEdit: (){
            Get.dialog(CustomDialogWidget(title: "reference".tr,
                child: AddNewCandidateReferenceWidget(candidateReferenceItem: candidateReferenceItem)));
          },)


        ]),
        ResponsiveMasonryGrid(children: [
          CandidateDetailItem(title: "name".tr,
              value:'${candidateReferenceItem?.name}'),

          CandidateDetailItem(title: "phone".tr,
              value:'${candidateReferenceItem?.phone}'),

          CandidateDetailItem(title: "email".tr,
              value:'${candidateReferenceItem?.email}'),

          CandidateDetailItem(title: "position".tr,
              value:'${candidateReferenceItem?.position}'),

          CandidateDetailItem(title: "company".tr,
              value:'${candidateReferenceItem?.company}'),

          CandidateDetailItem(title: "address".tr,
              value:'${candidateReferenceItem?.address}'),


        ])
      ],
    );
  }
}