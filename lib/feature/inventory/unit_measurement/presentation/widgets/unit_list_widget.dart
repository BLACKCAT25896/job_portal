import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/presentation/widgets/create_new_unit_widget.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/presentation/widgets/unit_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';

class UnitListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const UnitListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitController>(
      initState: (val) => Get.find<UnitController>().getUnit(1),
      builder: (controller) {
        final model = controller.unitModel;
        final data = model?.data;

        return GenericListSection<UnitItem>(
          sectionTitle: "product_management".tr,
          pathItems: ["unit".tr],
          addNewTitle: "add_new_unit".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "unit".tr,
                child: const CreateNewUnitWidget()),),
          headings: const ["name","short_name", 'status'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getUnit(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => UnitItemWidget(index: index, unitItem: item),
        );
      },
    );
  }
}
