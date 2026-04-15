import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/human_resource/attendance/controller/attendance_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectAttendanceWidget extends StatefulWidget {
  const SelectAttendanceWidget({super.key});

  @override
  State<SelectAttendanceWidget> createState() => _SelectAttendanceWidgetState();
}

class _SelectAttendanceWidgetState extends State<SelectAttendanceWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<AttendanceController>();
    if (controller.attendanceModel == null) {
      controller.getAttendanceList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "attendance"),
        GetBuilder<AttendanceController>(builder: (attendanceController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_attendance".tr,
                items: attendanceController.attendanceModel?.data?.data ?? [],
                selectedValue: attendanceController.selectedAttendanceItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    attendanceController.selectAttendance(val);
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
