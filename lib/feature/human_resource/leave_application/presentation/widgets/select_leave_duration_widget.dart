import 'package:mighty_job/feature/human_resource/leave_application/controller/leave_application_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectLeaveDurationWidget extends StatefulWidget {
  const SelectLeaveDurationWidget({super.key});

  @override
  State<SelectLeaveDurationWidget> createState() => _SelectLeaveDurationWidgetState();
}

class _SelectLeaveDurationWidgetState extends State<SelectLeaveDurationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("duration_type".tr, style: textRegular)),
        GetBuilder<LeaveApplicationController>(builder: (controller) {
            return CustomGenericDropdown(width: Get.width,
              title: "select".tr,
              items: controller.durationTypes,
              selectedValue: controller.selectedDurationType,
              getLabel: (item) => item,
              onChanged: (val) {
                if (val != null) {
                  controller.selectDurationType(val);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
