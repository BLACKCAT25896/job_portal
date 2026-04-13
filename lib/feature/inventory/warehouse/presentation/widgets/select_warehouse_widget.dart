import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectWarehouseWidget extends StatefulWidget {
  const SelectWarehouseWidget({super.key});

  @override
  State<SelectWarehouseWidget> createState() => _SelectWarehouseWidgetState();
}

class _SelectWarehouseWidgetState extends State<SelectWarehouseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: Dimensions.paddingSizeDefault),
        CustomTitle(title: "warehouse", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),
        GetBuilder<WarehouseController>(initState: (_) {
            if (Get.find<WarehouseController>().warehouseModel == null) {
              Get.find<WarehouseController>().getWarehouse(1);
            }
          }, builder: (warehouseController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: warehouseController.warehouseModel?.data?.data ?? [],
                selectedValue: warehouseController.selectedWarehouseItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  warehouseController.setSelectWarehouseItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}



