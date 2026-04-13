import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectInterviewWidget extends StatefulWidget {
  const SelectInterviewWidget({super.key});

  @override
  State<SelectInterviewWidget> createState() => _SelectInterviewWidgetState();
}

class _SelectInterviewWidgetState extends State<SelectInterviewWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<InterviewController>();
    if (controller.interviewModel == null) {
      controller.getInterviewList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "interview"),
        GetBuilder<InterviewController>(builder: (interviewController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_interview".tr,
                items: interviewController.interviewModel?.data?.data ?? [],
                selectedValue: interviewController.selectedInterviewItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    interviewController.selectInterview(val);
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
