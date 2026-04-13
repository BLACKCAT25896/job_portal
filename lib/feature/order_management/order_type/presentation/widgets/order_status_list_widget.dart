import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/model/order_type_model.dart';
import 'package:ecommerce/feature/order_management/order_type/logic/order_type_controller.dart';
import 'package:ecommerce/feature/order_management/order_type/presentation/widgets/create_new_order_type_widget.dart';
import 'package:ecommerce/feature/order_management/order_type/presentation/widgets/order_status_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';


class OrderTypeListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const OrderTypeListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTypeController>(
     initState: (val)=> Get.find<OrderTypeController>().getOrderType(1),
      builder: (controller) {
        final model = controller.orderTypeModel;
        final data = model?.data;

        return GenericListSection<OrderTypeItem>(
          sectionTitle: "manage_order".tr,
          pathItems: ["order_type".tr],
          headings: const ["name","status"],
          addNewTitle: "add_new_order_type".tr,
          onAddNewTap: ()=> Get.dialog(CustomDialogWidget(
            title: "order_type".tr,
              child: CreateNewOrderTypeWidget())),
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: model?.data?.total ?? 0,
          offset: model?.data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getOrderType(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => OrderTypeItemWidget(index: index, orderTypeItem: item),
        );
      },
    );
  }
}

