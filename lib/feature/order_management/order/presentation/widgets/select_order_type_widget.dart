import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/profile/domain/model/status_update_body.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectOrderTypeWidget extends StatefulWidget {
  final String? selectedOrderStatus;
  final int? orderId;
  const SelectOrderTypeWidget({super.key, this.selectedOrderStatus, this.orderId});

  @override
  State<SelectOrderTypeWidget> createState() => _SelectOrderTypeWidgetState();
}

class _SelectOrderTypeWidgetState extends State<SelectOrderTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomGenericDropdown(width: Get.width, title: "select".tr,
            items: orderController.orderStatusList,
            selectedValue: widget.selectedOrderStatus,
            getLabel: (item) => item.toString(),
            onChanged: (val) {
            StatusUpdateBody body = StatusUpdateBody(
              status: val.toString(),
              id: widget.orderId,
              type: "order");
            Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
              orderController.getOrder(1);
            });
            },
          ),
        );
      },
    );
  }
}
