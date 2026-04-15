import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/human_resource/attendance/controller/attendance_controller.dart';
import 'package:mighty_job/feature/human_resource/attendance/domain/models/attendance_model.dart';
import 'package:mighty_job/feature/human_resource/attendance/presentation/screens/create_new_attendance_screen.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class AttendanceItemWidget extends StatelessWidget {
  final AttendanceItem? attendanceItem;
  final int index;
  const AttendanceItemWidget({super.key, this.attendanceItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${attendanceItem?.employee?.firstName??''} ${attendanceItem?.employee?.lastName??''}')),
      Expanded(child: CustomTextItemWidget(text: attendanceItem?.date?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: attendanceItem?.firstClockIn?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: attendanceItem?.lastClockOut?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: attendanceItem?.hoursWorked?? 'N/A')),

      EditDeletePopupMenu(onEdit: (){
          Get.dialog(CreateNewAttendanceScreen(attendanceItem: attendanceItem));
        }, onDelete: (){
        Get.dialog(ConfirmationDialog(title: "attendance", onTap: (){
            Get.back();
            Get.find<AttendanceController>().deleteAttendance(attendanceItem!.id!);
          },));
      },
      ),
    ],
    ):
    CustomContainer(borderRadius: 5, showShadow: false,
      child: Column(spacing: Dimensions.paddingSizeSmall,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:'${attendanceItem?.employee?.firstName??''} ${attendanceItem?.employee?.lastName??''}')),

          ]),

          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
           Expanded(child: CustomTextItemWidget(text: attendanceItem?.date?? 'N/A')),
            Expanded(child: CustomTextItemWidget(text: attendanceItem?.firstClockIn?? 'N/A')),
            Expanded(child: CustomTextItemWidget(text: attendanceItem?.lastClockOut?? 'N/A')),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
           Expanded(child: CustomTextItemWidget(text: attendanceItem?.hoursWorked?? 'N/A')),


            EditDeletePopupMenu(onEdit: (){
              Get.dialog(CreateNewAttendanceScreen(attendanceItem: attendanceItem));
            }, onDelete: (){
              Get.dialog(ConfirmationDialog(title: "attendance", onTap: (){
                Get.back();
                Get.find<AttendanceController>().deleteAttendance(attendanceItem!.id!);
              },));
            }),
          ]),
        ],
      ),
    );
  }
}