import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/logic/purchase_returns_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectPurchaseReturnWidget extends StatefulWidget {
  const SelectPurchaseReturnWidget({super.key});

  @override
  State<SelectPurchaseReturnWidget> createState() => _SelectPurchaseReturnWidgetState();
}

class _SelectPurchaseReturnWidgetState extends State<SelectPurchaseReturnWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: "purchase_return",
          leftPadding: 0,
          fontSize: Dimensions.fontSizeDefault,
        ),

        GetBuilder<PurchaseReturnController>(
          initState: (_) {
            if (Get.find<PurchaseReturnController>().purchaseReturnModel == null) { // ✅ use foodModel
              Get.find<PurchaseReturnController>().getPurchaseReturn(1);
            }
          },
          builder: (foodController) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(
                width: Get.width,
                title: "select".tr,
                items: foodController.purchaseReturnModel?.data?.data ?? [], // ✅ correct model
                selectedValue: foodController.selectedPurchaseReturnItem,
                getLabel: (item) => item.name ?? '', // adjust property if needed
                onChanged: (val) {
                  foodController.setSelectPurchaseReturnItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
