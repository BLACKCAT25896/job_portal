import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_generic_dropdown.dart';

class SelectCandidateCertificateWidget extends StatefulWidget {
  const SelectCandidateCertificateWidget({super.key});

  @override
  State<SelectCandidateCertificateWidget> createState() => _SelectCandidateCertificateWidgetState();
}

class _SelectCandidateCertificateWidgetState extends State<SelectCandidateCertificateWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<CandidateCertificateController>();
    if (controller.candidateCertificateModel == null) {
      controller.getCandidateCertificateList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("candidate_certificate".tr, style: textRegular,),),
        GetBuilder<CandidateCertificateController>(builder: (candidateCertificateController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: candidateCertificateController.candidateCertificateModel?.data?.data ?? [],
                selectedValue: candidateCertificateController.selectedCandidateCertificateItem,
                getLabel: (item) => item.firstName ?? '',
                onChanged: (val) {
                  if (val != null) {
                    candidateCertificateController.selectCandidateCertificate(val);
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
