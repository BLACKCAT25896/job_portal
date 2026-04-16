import 'package:mighty_job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateResumeWidget extends StatefulWidget {
  const SelectCandidateResumeWidget({super.key});

  @override
  State<SelectCandidateResumeWidget> createState() => _SelectCandidateResumeWidgetState();
}

class _SelectCandidateResumeWidgetState extends State<SelectCandidateResumeWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateResumeController>();
    if (controller.candidateResumeModel == null) {
      controller.getCandidateResumeList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_resume".tr, style: textRegular,),),
        GetBuilder<CandidateResumeController>(builder: (candidateResumeController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateResumeController.candidateResumeModel?.data?.data ?? [],
                selectedValue: candidateResumeController.selectedCandidateResumeItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateResumeController.selectCandidateResume(val);
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
