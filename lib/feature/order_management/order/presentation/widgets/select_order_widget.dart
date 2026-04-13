import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectOrderWidget extends StatefulWidget {
  const SelectOrderWidget({super.key});

  @override
  State<SelectOrderWidget> createState() => _SelectOrderWidgetState();
}

class _SelectOrderWidgetState extends State<SelectOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTitle(title: "order", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

        GetBuilder<OrderController>(initState: (_) {
            if (Get.find<OrderController>().orderModel == null) {
              Get.find<OrderController>().getOrder(1);
            }
          },
          builder: (foodController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width, title: "select".tr,
                items: foodController.orderModel?.data ?? [],
                selectedValue: foodController.selectedOrderItem,
                getLabel: (item) => item.orderNumber ?? '',
                onChanged: (val) {foodController.setSelectOrderItem(val!);},
              ),
            );
          },
        ),
      ],
    );
  }
}
