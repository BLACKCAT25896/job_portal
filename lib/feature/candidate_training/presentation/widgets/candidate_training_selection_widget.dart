import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateTrainingWidget extends StatefulWidget {
  const SelectCandidateTrainingWidget({super.key});

  @override
  State<SelectCandidateTrainingWidget> createState() => _SelectCandidateTrainingWidgetState();
}

class _SelectCandidateTrainingWidgetState extends State<SelectCandidateTrainingWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateTrainingController>();
    if (controller.candidateTrainingModel == null) {
      controller.getCandidateTrainingList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_training".tr, style: textRegular,),),
        GetBuilder<CandidateTrainingController>(builder: (candidateTrainingController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateTrainingController.candidateTrainingModel?.data?.data ?? [],
                selectedValue: candidateTrainingController.selectedCandidateTrainingItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateTrainingController.selectCandidateTraining(val);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
