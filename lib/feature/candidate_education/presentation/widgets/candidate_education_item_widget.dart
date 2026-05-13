import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateEducationItemWidget extends StatelessWidget {
  final CandidateEducationItem? candidateEducationItem;
  final int index;
  const CandidateEducationItemWidget({super.key, this.candidateEducationItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Text("${"education".tr} ${index+1}",
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

          EditDeleteSection(isHorizontal: true, onDelete: (){
            Get.dialog(ConfirmationDialog(title: "candidate_education", onTap: (){
              Get.back();
              Get.find<CandidateEducationController>().deleteCandidateEducation((candidateEducationItem!.id!));
            },));

          }, onEdit: (){
            Get.dialog(CustomDialogWidget(title: "candidate_education".tr,
                child: AddNewCandidateEducationWidget(candidateEducationItem: candidateEducationItem)));
          },)


        ]),
        ResponsiveMasonryGrid(children: [
          CandidateDetailItem(title: "level_of_education".tr,
              value:'${candidateEducationItem?.degreeTitle}'),
          CandidateDetailItem(title: "exam_or_degree_title".tr,
              value:'${candidateEducationItem?.degreeTitle}'),
          CandidateDetailItem(title: "concentration_or_major_or_group".tr,
              value:candidateEducationItem?.major??'-'),
          CandidateDetailItem(title: "institute_or_university".tr,
              value:'${candidateEducationItem?.institute}'),

          CandidateDetailItem(title: "result".tr,
              value:'${candidateEducationItem?.result}'),
          CandidateDetailItem(title: "cgpa".tr, value:"Grade"),

          CandidateDetailItem(title: "scale".tr, value:'${4}'),

          CandidateDetailItem(title: "passing_year".tr,
              value:candidateEducationItem?.passingYear??"-"),
          CandidateDetailItem(title: "duration_years".tr,
              value:'${candidateEducationItem?.durationYears??"-"}'),
          CandidateDetailItem(title: "achievement".tr,
              value:candidateEducationItem?.achievement??'-'),

        ])
      ],
    );
  }
}