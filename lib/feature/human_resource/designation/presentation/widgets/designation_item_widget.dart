import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:ecommerce/feature/human_resource/designation/domain/models/designation_model.dart';
import 'package:ecommerce/feature/human_resource/designation/presentation/screens/create_new_designation_screen.dart';
import 'package:ecommerce/feature/profile/domain/model/status_update_body.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class DesignationItemWidget extends StatelessWidget {
  final DesignationItem? designationItem;
  final int index;
  const DesignationItemWidget({super.key, this.designationItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: Text('${designationItem?.title}', style: textRegular.copyWith())),
      ActiveInActiveWidget(active: designationItem?.status == "1",
      onChanged: (val){
        StatusUpdateBody body = StatusUpdateBody(id: int.parse(designationItem!.id!),type: "designation", status: val? "1" : "0");
        Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
          await Get.find<DesignationController>().getDesignationList(1);
        });
      },),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
          onSelected: (option) {
            if (option.title == "edit".tr) {
              Get.dialog(CreateNewDesignationScreen(designationItem: designationItem));
            } else if (option.title == "delete".tr) {
              Get.dialog(ConfirmationDialog(title: "designation",
                onTap: (){
                  Get.back();
                  Get.find<DesignationController>().deleteDesignation(int.parse(designationItem!.id!));
                },));

            }
          }),

    ],
    );
  }
}