import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/create_new_supplier_widget.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/supplier_item_widget.dart';

class SupplierListWidget extends StatelessWidget {
  final bool fromFilter;
  final ScrollController scrollController;
  const SupplierListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierController>(
      initState: (val) => Get.find<SupplierController>().getSupplier(1),
      builder: (controller) {
        final model = controller.supplierModel;
        final data = model?.data;

        return GenericListSection<SupplierItem>(
          showRouteSection: !fromFilter,
          showActionOption: !fromFilter,
          sectionTitle: "purchase_management".tr,
          pathItems: ["supplier".tr],
          addNewTitle: "add_new_supplier".tr,
          onAddNewTap: () => showDialog(context: context, builder: (_) => Dialog(child: const CreateNewSupplierWidget()),),
          headings:  ["image", "name",'phone',"email", "address", if(!fromFilter)'status'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getSupplier(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => InkWell(onTap: (){
            if(fromFilter){
              controller.setSelectSupplierItem(item);
              Get.back();
            }
          },
              child: SupplierItemWidget(fromFilter: fromFilter,
                  index: index, supplierItem: item)),
        );
      },
    );
  }
}
