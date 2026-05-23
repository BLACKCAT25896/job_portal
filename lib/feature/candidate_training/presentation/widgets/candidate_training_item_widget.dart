import 'dart:convert';

import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_training_screen.dart';
import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_model.dart';
import 'package:job/feature/candidate_training/presentation/widgets/add_new_candidate_training_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateTrainingItemWidget extends StatelessWidget {
  final CandidateTrainingItem? candidateTrainingItem;
  final int index;
  const CandidateTrainingItemWidget({super.key, this.candidateTrainingItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Text("${"training".tr} ${index+1}",
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

          EditDeleteSection(isHorizontal: true, onDelete: (){
            Get.dialog(ConfirmationDialog(
              title: "training", onTap: (){
              Get.back();
              Get.find<CandidateTrainingController>().deleteCandidateTraining((candidateTrainingItem!.id!));
            },));

          }, onEdit: (){
            if(isDesktop){
              Get.dialog(CustomDialogWidget(title: "training".tr,
                  child: AddNewCandidateTrainingWidget(candidateTrainingItem: candidateTrainingItem)));
            }else{
              Get.to(()=> EditTrainingScreen(candidateTrainingItem: candidateTrainingItem));
            }

          },)


        ]),
        ResponsiveMasonryGrid(children: [
          CandidateDetailItem(title: "title".tr,
              value:'${candidateTrainingItem?.title}'),
          CandidateDetailItem(title: "topics".tr,
              value:'${jsonDecode(candidateTrainingItem?.topicsCovered??'')}'),
          CandidateDetailItem(title: "training_year".tr,
              value:candidateTrainingItem?.trainingYear??'-'),
          CandidateDetailItem(title: "institute".tr,
              value:'${candidateTrainingItem?.institute}'),

          CandidateDetailItem(title: "duration".tr,
              value:'${candidateTrainingItem?.durationValue} ${"months".tr}'),
          CandidateDetailItem(title: "location".tr,
              value:'${candidateTrainingItem?.location}'),


        ])
      ],
    );
  }
}