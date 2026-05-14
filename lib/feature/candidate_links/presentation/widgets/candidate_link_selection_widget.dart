import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateLinkWidget extends StatefulWidget {
  const SelectCandidateLinkWidget({super.key});

  @override
  State<SelectCandidateLinkWidget> createState() => _SelectCandidateLinkWidgetState();
}

class _SelectCandidateLinkWidgetState extends State<SelectCandidateLinkWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateLinkController>();
    if (controller.candidateLinkModel == null) {
      controller.getCandidateLinkList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_link".tr, style: textRegular,),),
        GetBuilder<CandidateLinkController>(builder: (candidateLinkController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateLinkController.candidateLinkModel?.data?.data ?? [],
                selectedValue: candidateLinkController.selectedCandidateLinkItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateLinkController.selectCandidateLink(val);
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
