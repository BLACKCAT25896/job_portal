import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateReferenceWidget extends StatefulWidget {
  const SelectCandidateReferenceWidget({super.key});

  @override
  State<SelectCandidateReferenceWidget> createState() => _SelectCandidateReferenceWidgetState();
}

class _SelectCandidateReferenceWidgetState extends State<SelectCandidateReferenceWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateReferenceController>();
    if (controller.candidateReferenceModel == null) {
      controller.getCandidateReferenceList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_reference".tr, style: textRegular,),),
        GetBuilder<CandidateReferenceController>(builder: (candidateReferenceController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateReferenceController.candidateReferenceModel?.data?.data ?? [],
                selectedValue: candidateReferenceController.selectedCandidateReferenceItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateReferenceController.selectCandidateReference(val);
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
