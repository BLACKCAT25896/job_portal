import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:mighty_job/feature/account_management/accounting/logic/account_controller.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/account_item_widget.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/create_new_account_widget.dart';

class AccountListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AccountListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      initState: (val) async {
        final accountCtrl = Get.find<AccountController>();
        accountCtrl.getAccountList(1);
      },
      builder: (controller) {
        final model = controller.accountModel;
        final data = model?.data;
        return GenericListSection<AccountItem>(
          sectionTitle: "account_management".tr,
          pathItems: ["account".tr],
          addNewTitle: "create_new_account".tr,
          onAddNewTap: () {
          Get.dialog(CustomDialogWidget(title: "account".tr,
              child:CreateNewAccountWidget()));
          },
          headings: const ["name", "code", "type", "opening_balance", "current_balance", "status",],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) => controller.getAccountList(offset ?? 1),
          items: data?.data ?? [],
          itemBuilder: (item, index) => AccountItemWidget(accountItem: item, index: index),
        );
      },
    );
  }
}
