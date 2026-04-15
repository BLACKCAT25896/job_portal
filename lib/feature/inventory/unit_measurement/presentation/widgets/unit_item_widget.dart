import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/presentation/widgets/create_new_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class UnitItemWidget extends StatelessWidget {
  final UnitItem? unitItem;
  final int index;
  const UnitItemWidget({super.key, this.unitItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text:"${unitItem?.name}")),
      Expanded(child: CustomTextItemWidget(text:"${unitItem?.code}")),
      ActiveInActiveWidget(active: unitItem?.status == 1, onChanged: (val){
        updateStatus(value: val, id: unitItem!.id.toString(), type: "unit",
            onSuccess: ()=> Get.find<UnitController>().getUnit(1));
        },),


      EditDeletePopupMenu(onEdit: (){
          Get.dialog(CustomDialogWidget(title: "unit".tr,
              child: CreateNewUnitWidget(unitItem: unitItem)));
        },
        onDelete: (){
          Get.dialog(ConfirmationDialog(title: "unit", onTap: (){
            Get.back();
            Get.find<UnitController>().deleteUnit(unitItem!.id!);
          }));

        },
      ),
      ]):CustomContainer(showShadow: false, borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeSmall,
          children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${unitItem?.name}")),
            ]),

            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextItemWidget(text:"${"code".tr}: ${unitItem?.code}")),
              ActiveInActiveWidget(active: unitItem?.status == 1, onChanged: (val){
                updateStatus(value: val, id: unitItem!.id.toString(), type: "unit",
                    onSuccess: ()=> Get.find<UnitController>().getUnit(1));
              },),
              EditDeletePopupMenu(onEdit: (){
                Get.dialog(CustomDialogWidget(title: "unit".tr,
                    child: CreateNewUnitWidget(unitItem: unitItem)));
              }, onDelete: (){
                Get.dialog(ConfirmationDialog(title: "unit", onTap: (){
                  Get.back();
                  Get.find<UnitController>().deleteUnit(unitItem!.id!);
                }));
                },
              ),
            ]),
          ],
        ),
      );
  }
}