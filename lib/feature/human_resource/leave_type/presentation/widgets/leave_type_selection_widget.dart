import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/human_resource/leave_type/controller/leave_type_controller.dart';

class SelectLeaveTypeWidget extends StatefulWidget {
  const SelectLeaveTypeWidget({super.key});

  @override
  State<SelectLeaveTypeWidget> createState() => _SelectLeaveTypeWidgetState();
}

class _SelectLeaveTypeWidgetState extends State<SelectLeaveTypeWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<LeaveTypeController>();
    if (controller.leaveTypeModel == null) {
      controller.getLeaveTypeList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("leaveType".tr, style: textRegular)),

        GetBuilder<LeaveTypeController>(builder: (leaveTypeController) {
            return CustomGenericDropdown(width: Get.width,
              title: "select".tr,
              items: leaveTypeController.leaveTypeModel?.data?.data ?? [],
              selectedValue: leaveTypeController.selectedLeaveTypeItem,
              getLabel: (item) => item.name ?? '',
              onChanged: (val) {
                if (val != null) {
                  leaveTypeController.selectLeaveType(val);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
