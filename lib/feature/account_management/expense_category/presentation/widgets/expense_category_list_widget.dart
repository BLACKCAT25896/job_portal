import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/feature/account_management/expense_category/presentation/widgets/create_new_expense_category_widget.dart';
import 'package:mighty_job/feature/account_management/expense_category/presentation/widgets/expense_category_item_widget.dart';

class ExpenseCategoryListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const ExpenseCategoryListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpanseCategoryController>(initState: (val) {
        final ctrl = Get.find<ExpanseCategoryController>();
        ctrl.getExpanseCategoryList(1);
      },
      builder: (controller) {
        final model = controller.expenseCategoryModel;
        final data = model?.data;

        return GenericListSection<ExpenseCategoryItem>(
          sectionTitle: "account_management".tr,
          pathItems: ["expense_category".tr],
          addNewTitle: "add_new_expense_category".tr,
          onAddNewTap: () {Get.dialog(CustomDialogWidget(title: "expense_category".tr,
              child: CreateNewExpenseCategoryWidget()));
          },
          headings: const [ "name"],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) => controller.getExpanseCategoryList(offset ?? 1),
          items: data?.data ?? [],
          itemBuilder: (item, index) => ExpanseCategoryItemWidget(index: index, expenseCategoryItem: item),
        );
      },
    );
  }
}
