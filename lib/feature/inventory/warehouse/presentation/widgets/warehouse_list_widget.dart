import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/inventory/warehouse/domain/model/warehouse_model.dart';
import 'package:mighty_job/feature/inventory/warehouse/presentation/widgets/create_new_warehouse_widget.dart';
import 'package:mighty_job/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:mighty_job/feature/inventory/warehouse/presentation/widgets/warehouse_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';

class WarehouseListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const WarehouseListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarehouseController>(
      initState: (val) => Get.find<WarehouseController>().getWarehouse(1),
      builder: (controller) {
        final model = controller.warehouseModel;
        final data = model?.data;

        return GenericListSection<WarehouseItem>(
          sectionTitle: "product_management".tr,
          pathItems: ["warehouse".tr],
          addNewTitle: "add_new_warehouse".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(
              title: "warehouse".tr,
                child: const CreateNewWarehouseWidget()),),
          headings: const ["name", "manager", "address", 'status'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getWarehouse(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => WarehouseItemWidget(index: index, warehouseItem: item),
        );
      },
    );
  }
}
