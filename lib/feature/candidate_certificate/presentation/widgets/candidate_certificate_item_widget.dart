
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_model.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/add_new_candidate_certificate_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateCertificateItemWidget extends StatelessWidget {
  final CandidateCertificateItem? candidateCertificateItem;
  final int index;
  const CandidateCertificateItemWidget({super.key, this.candidateCertificateItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Text("${"certificate".tr} ${index+1}",
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

          EditDeleteSection(isHorizontal: true, onDelete: (){
            Get.dialog(ConfirmationDialog(
              title: "certificate", onTap: (){
              Get.back();
              Get.find<CandidateCertificateController>().deleteCandidateCertificate((candidateCertificateItem!.id!));
            },));

          }, onEdit: (){
            Get.dialog(CustomDialogWidget(title: "certificate".tr,
                child: AddNewCandidateCertificateWidget(candidateCertificateItem: candidateCertificateItem)));
          },)


        ]),
        ResponsiveMasonryGrid(children: [
          CandidateDetailItem(title: "title".tr,
              value:'${candidateCertificateItem?.title}'),

          CandidateDetailItem(title: "institute".tr,
              value:'${candidateCertificateItem?.institute}'),

          CandidateDetailItem(title: "duration".tr,
              value:'${candidateCertificateItem?.durationValue} ${"hours".tr}'),
          CandidateDetailItem(title: "location".tr,
              value:'${candidateCertificateItem?.location}'),


        ])
      ],
    );
  }
}