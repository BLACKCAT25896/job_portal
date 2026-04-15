import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectInterviewStatusWidget extends StatefulWidget {
  const SelectInterviewStatusWidget({super.key});

  @override
  State<SelectInterviewStatusWidget> createState() => _SelectInterviewStatusWidgetState();
}

class _SelectInterviewStatusWidgetState extends State<SelectInterviewStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("status".tr, style: textRegular)),
        GetBuilder<InterviewController>(builder: (interviewController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_status".tr,
                items: interviewController.interviewStatus,
                selectedValue: interviewController.selectedInterviewStatus,
                getLabel: (item) => item,
                onChanged: (val) {
                  if (val != null) {
                    interviewController.selectInterviewStatus(val);
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
