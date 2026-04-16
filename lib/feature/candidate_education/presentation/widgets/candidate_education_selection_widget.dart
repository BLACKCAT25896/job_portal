import 'package:mighty_job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateEducationWidget extends StatefulWidget {
  const SelectCandidateEducationWidget({super.key});

  @override
  State<SelectCandidateEducationWidget> createState() => _SelectCandidateEducationWidgetState();
}

class _SelectCandidateEducationWidgetState extends State<SelectCandidateEducationWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateEducationController>();
    if (controller.candidateEducationModel == null) {
      controller.getCandidateEducationList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_education".tr, style: textRegular,),),
        GetBuilder<CandidateEducationController>(builder: (candidateEducationController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateEducationController.candidateEducationModel?.data?.data ?? [],
                selectedValue: candidateEducationController.selectedCandidateEducationItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateEducationController.selectCandidateEducation(val);
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
