import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:ecommerce/feature/account_management/expense/logic/expense_controller.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/widgets/create_new_expense_widget.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/widgets/expense_item_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const ExpenseListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpenseController>(initState: (state) {
        final ctrl = Get.find<ExpenseController>();
        ctrl.getExpanseList(1);
      },
      builder: (controller) {
        final model = controller.expenseModel;
        final data = model?.data;
        return GenericListSection<ExpenseItem>(
          sectionTitle: "account_management".tr,
          pathItems: ["expense_list".tr],
          addNewTitle: "add_new_expense".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "expense".tr,
              child: CreateNewExpenseWidget())),
          headings: const [ "account_name", "category", "amount", "note",],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => controller.getExpanseList(offset ?? 1),
          items: data?.data ?? [],

          itemBuilder: (item, index) => ExpenseItemWidget(index: index, expenseItem: item),
        );
      },
    );
  }
}
