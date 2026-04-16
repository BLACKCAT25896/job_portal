import 'package:mighty_job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateExperienceWidget extends StatefulWidget {
  const SelectCandidateExperienceWidget({super.key});

  @override
  State<SelectCandidateExperienceWidget> createState() => _SelectCandidateExperienceWidgetState();
}

class _SelectCandidateExperienceWidgetState extends State<SelectCandidateExperienceWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateExperienceController>();
    if (controller.candidateExperienceModel == null) {
      controller.getCandidateExperienceList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_experience".tr, style: textRegular,),),
        GetBuilder<CandidateExperienceController>(builder: (candidateExperienceController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateExperienceController.candidateExperienceModel?.data?.data ?? [],
                selectedValue: candidateExperienceController.selectedCandidateExperienceItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateExperienceController.selectCandidateExperience(val);
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
