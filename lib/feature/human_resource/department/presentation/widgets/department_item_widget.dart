import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/human_resource/department/controller/department_controller.dart';
import 'package:ecommerce/feature/human_resource/department/domain/models/department_model.dart';
import 'package:ecommerce/feature/human_resource/department/presentation/screens/create_new_department_screen.dart';
import 'package:ecommerce/feature/profile/domain/model/status_update_body.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class DepartmentItemWidget extends StatelessWidget {
  final DepartmentItem? departmentItem;
  final int index;
  const DepartmentItemWidget({super.key, this.departmentItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: Text('${departmentItem?.name}', style: textRegular.copyWith())),
      ActiveInActiveWidget(active: departmentItem?.status == "1", onChanged: (val){
        StatusUpdateBody body = StatusUpdateBody(
          id: int.parse(departmentItem!.id!), status: val ? "1" : "0", type: "department");
        Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
          await Get.find<DepartmentController>().getDepartmentList(1);
        });
      },),
      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "department", content: "department",
          onTap: (){
            Get.back();
            Get.find<DepartmentController>().deleteDepartment(int.parse(departmentItem!.id!));
          },));
      }, onEdit: (){
        Get.dialog(CreateNewDepartmentScreen(departmentItem: departmentItem));
      },)
    ],
    );
  }
}