import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/human_resource/leave_application/controller/leave_application_controller.dart';

class SelectLeaveApplicationWidget extends StatefulWidget {
  const SelectLeaveApplicationWidget({super.key});

  @override
  State<SelectLeaveApplicationWidget> createState() => _SelectLeaveApplicationWidgetState();
}

class _SelectLeaveApplicationWidgetState extends State<SelectLeaveApplicationWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<LeaveApplicationController>();
    if (controller.leaveApplicationModel == null) {
      controller.getLeaveApplicationList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "leave_application"),
        GetBuilder<LeaveApplicationController>(builder: (leaveApplicationController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_leave_application".tr,
                items: leaveApplicationController.leaveApplicationModel?.data?.data ?? [],
                selectedValue: leaveApplicationController.selectedLeaveApplicationItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    leaveApplicationController.selectLeaveApplication(val);
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
