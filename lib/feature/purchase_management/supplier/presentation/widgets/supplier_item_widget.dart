import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/create_new_supplier_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';


class SupplierItemWidget extends StatelessWidget {
  final SupplierItem? supplierItem;
  final int index;
  final bool fromFilter;
  const SupplierItemWidget({super.key, this.supplierItem,
    required this.index, this.fromFilter = false});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        CustomImage(width: 40, height: 40, image: '${AppConstants.imageBaseUrl}/suppliers/${supplierItem?.image}'),
        Expanded(child: CustomTextItemWidget(text:"${supplierItem?.name}")),
        Expanded(child: CustomTextItemWidget(text:"${supplierItem?.phone}")),
        Expanded(child: CustomTextItemWidget(text:supplierItem?.email??'N/A')),
        Expanded(child: CustomTextItemWidget(text:supplierItem?.address??'N/a')),

        if(!fromFilter)
        ActiveInActiveWidget(active: supplierItem?.status =="1", onChanged: (value){
          updateStatus(value: value, id: supplierItem!.id!.toString(), type: "supplier",
              onSuccess: () async => Get.find<SupplierController>().getSupplier(1));
        },),


      if(!fromFilter)
      EditDeletePopupMenu(onEdit: (){
          Get.dialog(Dialog(child: CreateNewSupplierWidget(supplierItem: supplierItem)));
        },onDelete: (){
        Get.dialog(ConfirmationDialog(title: "supplier".tr, onTap: (){
          Get.back();
          Get.find<SupplierController>().deleteSupplier(int.parse(supplierItem!.id!.toString()));
        }));
      })
    ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            CustomImage(width: 40, height: 40, image: '${AppConstants.imageBaseUrl}/suppliers/${supplierItem?.image}'),
            Expanded(child: CustomTextItemWidget(text:"${supplierItem?.name}")),
          ]),
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: CustomTextItemWidget(text:"${supplierItem?.phone}")),
          Expanded(child: CustomTextItemWidget(text:supplierItem?.email??'N/A')),

        ]),

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: CustomTextItemWidget(text:supplierItem?.address??'N/a')),
          if(!fromFilter)
            ActiveInActiveWidget(active: supplierItem?.status =="1", onChanged: (value){
              updateStatus(value: value, id: supplierItem!.id!.toString(), type: "supplier",
                  onSuccess: () async => Get.find<SupplierController>().getSupplier(1));
            },),


          if(!fromFilter)
            EditDeletePopupMenu(onEdit: (){
              Get.dialog(Dialog(child: CreateNewSupplierWidget(supplierItem: supplierItem)));
            },onDelete: (){
              Get.dialog(ConfirmationDialog(title: "supplier".tr, onTap: (){
                Get.back();
                Get.find<SupplierController>().deleteSupplier(int.parse(supplierItem!.id!.toString()));
              }));
            })
        ]),
        ],
      ),
    );
  }
}