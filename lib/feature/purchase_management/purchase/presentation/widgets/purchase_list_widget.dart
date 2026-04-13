import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase/logic/purchase_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/create_new_purchase_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/purchase_item_widget.dart';

class PurchaseListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PurchaseListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(
      initState: (val) => Get.find<PurchaseController>().getPurchase(1),
      builder: (controller) {
        final model = controller.purchaseModel;
        final data = model?.data;

        return GenericListSection<PurchaseItem>(
          sectionTitle: "purchase_management".tr,
          pathItems: ["purchase".tr],
          addNewTitle: "add_new_purchase".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(
            title: "purchase".tr,width: 1000,
              child: const CreateNewPurchaseWidget()),),
          headings: const ["invoice_id", "supplier",'subtotal',"date", "payment_type","payment","items", ],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getPurchase(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => PurchaseItemWidget(index: index, purchaseItem: item),
        );
      },
    );
  }
}
