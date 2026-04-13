import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/inventory/warehouse/domain/model/warehouse_model.dart';
import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:ecommerce/feature/inventory/warehouse/presentation/widgets/create_new_warehouse_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class WarehouseItemWidget extends StatelessWidget {
  final WarehouseItem? warehouseItem;
  final int index;
  const WarehouseItemWidget({super.key, this.warehouseItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text:"${warehouseItem?.name}")),
      Expanded(child: CustomTextItemWidget(text:"${warehouseItem?.managerName}")),
      Expanded(child: CustomTextItemWidget(text:"${warehouseItem?.address}")),
      ActiveInActiveWidget(active: warehouseItem?.status == "active", onChanged: (val){
        updateStatus(value: val, id: warehouseItem!.id.toString(), type: "warehouse",
            onSuccess: ()=> Get.find<WarehouseController>().getWarehouse(1));
        },),


      EditDeletePopupMenu(onEdit: (){
          Get.dialog(CustomDialogWidget(title: "warehouse".tr,
              child: CreateNewWarehouseWidget(warehouseItem: warehouseItem)));
        },
        onDelete: (){
          Get.dialog(ConfirmationDialog(title: "warehouse", onTap: (){
            Get.back();
            Get.find<WarehouseController>().deleteWarehouse(warehouseItem!.id!);
          }));

        },
      ),
      ]):CustomContainer(showShadow: false, borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeSmall,
          children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${warehouseItem?.name}")),
            ]),

            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextItemWidget(text:"${"address".tr}: ${warehouseItem?.address}")),
              ActiveInActiveWidget(active: warehouseItem?.status == "active", onChanged: (val){
                updateStatus(value: val, id: warehouseItem!.id.toString(), type: "warehouse",
                    onSuccess: ()=> Get.find<WarehouseController>().getWarehouse(1));
              },),
              EditDeletePopupMenu(onEdit: (){
                Get.dialog(Dialog(child: CreateNewWarehouseWidget(warehouseItem: warehouseItem)));
              }, onDelete: (){
                Get.dialog(ConfirmationDialog(title: "warehouse", onTap: (){
                  Get.back();
                  Get.find<WarehouseController>().deleteWarehouse(warehouseItem!.id!);
                }));
                },
              ),
            ]),
          ],
        ),
      );
  }
}