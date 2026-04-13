import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_type/controller/leave_type_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_type/domain/models/leave_type_model.dart';
import 'package:ecommerce/feature/human_resource/leave_type/presentation/screens/create_new_leave_type_screen.dart';
import 'package:ecommerce/util/dimensions.dart';

class LeaveTypeItemWidget extends StatelessWidget {
  final LeaveTypeItem? leaveTypeItem;
  final int index;
  const LeaveTypeItemWidget({super.key, this.leaveTypeItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${leaveTypeItem?.name}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveTypeItem?.maxDays}')),
      Expanded(child: CustomTextItemWidget(text:leaveTypeItem?.isPaid == "1"? "yes".tr : "no".tr)),
      Expanded(child: CustomTextItemWidget(text:leaveTypeItem?.carryForward == "1"? 'yes'.tr : "no".tr)),
      ActiveInActiveWidget(active: leaveTypeItem?.status == "1", onChanged: (val){
        updateStatus(value: val, id: leaveTypeItem!.id!, type: "leave-type",
            onSuccess: () => Get.find<LeaveTypeController>().getLeaveTypeList(1));

      },),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
        onSelected: (val){
        if(val.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "leave_type".tr,
              child: CreateNewLeaveTypeScreen(leaveTypeItem: leaveTypeItem)));
        }else {
            Get.dialog(ConfirmationDialog(title: "leave_type",
              onTap: (){
                Get.back();
                Get.find<LeaveTypeController>().deleteLeaveType(int.parse(leaveTypeItem!.id!));
              },));
          }
        }),
    ],
    );
  }
}