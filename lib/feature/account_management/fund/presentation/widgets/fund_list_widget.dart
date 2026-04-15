import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/account_management/fund/domain/model/fund_model.dart';
import 'package:mighty_job/feature/account_management/fund/logic/fund_controller.dart';
import 'package:mighty_job/feature/account_management/fund/presentation/widgets/create_new_fund_widget.dart';
import 'package:mighty_job/feature/account_management/fund/presentation/widgets/fund_item_widget.dart';

class FundListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const FundListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundController>(
      initState: (val) => Get.find<FundController>().getFund(1),
      builder: (controller) {
        final model = controller.fundModel;
        final data = model?.data;

        return GenericListSection<FundItem>(
          sectionTitle: "fund_reservation".tr,
          pathItems: ["fund".tr],
          addNewTitle: "add_new_fund".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "fund".tr,
              child: const CreateNewFundWidget()),),
          headings: const ["name", "type","code","opening_balance" ,"current_balance"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getFund(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => FundItemWidget(index: index, fund: item),
        );
      },
    );
  }
}
