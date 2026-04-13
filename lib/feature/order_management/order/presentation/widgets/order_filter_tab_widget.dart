import 'package:ecommerce/common/widget/side_menu/src/side_menu_item_widget.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/order_management/order_status/logic/order_status_controller.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideOrderMenu extends StatelessWidget {
  const SideOrderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrderStatusController>(initState: (val) {
        final controller = Get.find<OrderStatusController>();
        if (controller.orderStatusModel == null) {
          controller.getOrderStatus(1);
        }
      },
      builder: (orderController) {
        final items = orderController.orderStatusModel?.data?.data ?? [];

        return Column(children: items.map((status) => SideMenuItemWidget(
          title: status.name ?? 'N/A',
          keyValue: status.id.toString(), onTap: () {
            final index = items.indexOf(status);
            orderController.setSelectedIndex(index);
            Get.toNamed(RouteHelper.getOrderRoute());
            Get.find<OrderController>().getOrder(1, orderStatusId: status.id);
            }),
        ).toList());
      },
    );
  }
}
