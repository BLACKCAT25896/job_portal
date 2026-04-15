import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/tax_management/tax/domain/model/tax_model.dart';
import 'package:mighty_job/feature/tax_management/tax/logic/tax_controller.dart';
import 'package:mighty_job/feature/tax_management/tax/presentation/widgets/create_new_tax_widget.dart';
import 'package:mighty_job/feature/tax_management/tax/presentation/widgets/tax_item_widget.dart';

class TaxListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const TaxListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxController>(
      initState: (val) => Get.find<TaxController>().getTax(1),
      builder: (controller) {
        final model = controller.taxModel;
        final data = model?.data;

        return GenericListSection<TaxItem>(
          sectionTitle: "tax_management".tr,
          pathItems: ["tax".tr],
          addNewTitle: "add_new_tax".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "tax".tr,
              child: const CreateNewTaxWidget()),),
          headings: const ["name","reg_no","value","default"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getTax(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => TaxItemWidget(index: index, taxItem: item),
        );
      },
    );
  }
}
