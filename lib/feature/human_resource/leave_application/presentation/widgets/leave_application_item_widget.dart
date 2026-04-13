import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/leave_application/presentation/widgets/create_new_leave_application_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_application/controller/leave_application_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_application/domain/models/leave_application_model.dart';
import 'package:ecommerce/util/dimensions.dart';


class LeaveApplicationItemWidget extends StatelessWidget {
  final LeaveApplicationItem? leaveApplicationItem;
  final int index;
  const LeaveApplicationItemWidget({super.key, this.leaveApplicationItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.firstName} ${leaveApplicationItem?.lastName}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.reason}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.leaveTypeName}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.startDate}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.endDate}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.leaveDurationType?.tr}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.status}')),
      Expanded(child: CustomTextItemWidget(text:'${leaveApplicationItem?.adminNote}')),

      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (val){
        if(val.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "leave_application".tr,
              child: CreateNewLeaveApplicationWidget(leaveApplicationItem: leaveApplicationItem)));
        }else{
          Get.dialog(ConfirmationDialog(title: "leave_application", onTap: (){
              Get.back();
              Get.find<LeaveApplicationController>().deleteLeaveApplication(int.parse(leaveApplicationItem!.id!));
            },));
        }
      }),

    ],
    );
  }
}