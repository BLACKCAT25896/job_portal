import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:ecommerce/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:ecommerce/feature/account_management/deposit/presentation/widgets/create_new_deposit_widget.dart';
import 'package:ecommerce/feature/account_management/deposit/presentation/widgets/deposit_card_widget.dart';

class DepositListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const DepositListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(initState: (state) {
        final ctrl = Get.find<DepositController>();
        ctrl.getDepositList(1);
      },
      builder: (controller) {
        final model = controller.depositModel;
        final data = model?.data;

        return GenericListSection<DepositItem>(
          sectionTitle: "account_management".tr,
          pathItems: ["deposit_list".tr],
          addNewTitle: "add_new_deposit".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "deposit".tr,
                child: CreateNewDepositWidget()));
          },
          headings: const ["account_name", "category", "amount","received_from", "note"],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) => controller.getDepositList(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return DepositWidget(index: index, depositItem: item);
          },
        );
      },
    );
  }
}
