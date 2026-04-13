import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_model.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/order_management/order/presentation/widgets/order_item_widget.dart';

class OrderListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool isDashboard;
  const OrderListWidget({super.key, required this.scrollController,  this.isDashboard = false});

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
     initState: (val)=> Get.find<OrderController>().getOrder(1),
      builder: (controller) {
        final model = controller.orderModel;
        final data = model?.data;

        return GenericListSection<OrderItem>(
          showRouteSection: !widget.isDashboard,
          subWidget: SizedBox(width: 300,
              child: CustomSearch(hintText: 'search_by_order_id'.tr,
              searchController: searchController)),
          sectionTitle: "manage_order".tr,
          pathItems: ["order".tr],
          headings: const ["order_id","customer", "order_type","date","amount","order_status"],

          scrollController: widget.scrollController,
          isLoading: model == null,
          totalSize: model?.meta?.total ?? 0,
          offset: model?.meta?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getOrder(offset ?? 1),

          items: data ?? [],
          itemBuilder: (item, index) => OrderItemWidget(index: index, orderItem: item),
        );
      },
    );
  }
}

