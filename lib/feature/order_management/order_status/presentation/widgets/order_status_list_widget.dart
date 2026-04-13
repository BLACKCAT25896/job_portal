import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/model/order_status_model.dart';
import 'package:ecommerce/feature/order_management/order_status/logic/order_status_controller.dart';
import 'package:ecommerce/feature/order_management/order_status/presentation/widgets/create_new_order_status_widget.dart';
import 'package:ecommerce/feature/order_management/order_status/presentation/widgets/order_status_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';


class OrderStatusListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const OrderStatusListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
     initState: (val)=> Get.find<OrderStatusController>().getOrderStatus(1),
      builder: (controller) {
        final model = controller.orderStatusModel;
        final data = model?.data;

        return GenericListSection<OrderStatusItem>(
          sectionTitle: "manage_order".tr,
          pathItems: ["order_status".tr],
          headings: const ["name","status"],
          addNewTitle: "add_new_order_status".tr,
          onAddNewTap: ()=> Get.dialog(CustomDialogWidget(
            title: "order_status".tr, width: 600,
              child: CreateNewOrderStatusWidget())),

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: model?.data?.total ?? 0,
          offset: model?.data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getOrderStatus(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => OrderStatusItemWidget(index: index, orderStatusItem: item),
        );
      },
    );
  }
}

