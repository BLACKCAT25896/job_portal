import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/add_new_resource_widget.dart';
import 'package:mighty_job/feature/human_resource/attendance/controller/attendance_controller.dart';
import 'package:mighty_job/feature/human_resource/attendance/domain/models/attendance_model.dart';
import 'package:mighty_job/feature/human_resource/attendance/presentation/screens/create_new_attendance_screen.dart';
import 'package:mighty_job/feature/human_resource/attendance/presentation/widgets/attendance_item_widget.dart';

class AttendanceListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AttendanceListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      initState: (val) => Get.find<AttendanceController>().getAttendanceList(1),
      builder: (attendanceController) {
        final attendanceModel = attendanceController.attendanceModel;
        final attendanceData = attendanceModel?.data;

        return GenericListSection<AttendanceItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["attendance_report".tr],
          addNewTitle: "single_check_in".tr,
          subWidget: AddNewResourceWidget(title: "bulk_check_in".tr,onTap: (){

          }),
          onAddNewTap: () => Get.dialog(const CreateNewAttendanceScreen()),
          headings: const ["name",  "date", "time_in", "time_out","work_hours",],

          scrollController: scrollController,
          isLoading: attendanceModel == null,
          totalSize: attendanceData?.total ?? 0,
          offset: attendanceData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await attendanceController.getAttendanceList(offset ?? 1),

          items: attendanceData?.data ?? [],
          itemBuilder: (item, index) => AttendanceItemWidget(
            index: index,
            attendanceItem: item,
          ),
        );
      },
    );
  }
}