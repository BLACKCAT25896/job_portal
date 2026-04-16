import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateWidget extends StatefulWidget {
  const SelectCandidateWidget({super.key});

  @override
  State<SelectCandidateWidget> createState() => _SelectCandidateWidgetState();
}

class _SelectCandidateWidgetState extends State<SelectCandidateWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateController>();
    if (controller.candidateModel == null) {
      controller.getCandidateList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate".tr, style: textRegular,),),
        GetBuilder<CandidateController>(builder: (candidateController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_candidate".tr,
                items: candidateController.candidateModel?.data?.data ?? [],
                selectedValue: candidateController.selectedCandidateItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateController.selectCandidate(val);
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
