import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/logic/purchase_returns_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/presentation/widgets/purchase_returns_item_widget.dart';

class PurchaseReturnListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PurchaseReturnListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseReturnController>(
      initState: (val) => Get.find<PurchaseReturnController>().getPurchaseReturn(1),
      builder: (controller) {
        final model = controller.purchaseReturnModel;
        final data = model?.data;

        return GenericListSection<PurchaseReturnItem>(
          sectionTitle: "purchase_management".tr,
          pathItems: ["purchase_return".tr],
         headings: const ["name", "purchase_date",'quantity','received_quantity','returned_quantity','wastage_quantity'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getPurchaseReturn(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => PurchaseReturnItemWidget(index: index, purchaseReturnItem: item),
        );
      },
    );
  }
}
