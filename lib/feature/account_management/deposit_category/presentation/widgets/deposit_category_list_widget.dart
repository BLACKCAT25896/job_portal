import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/create_new_deposit_category_widget.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/deposit_category_item_widget.dart';

class DepositCategoryListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const DepositCategoryListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositCategoryController>(initState: (val) async {
        final ctrl = Get.find<DepositCategoryController>();
        ctrl.getDepositCategoryList(1);
      },
      builder: (controller) {
        final model = controller.depositCategoryModel;
        final data = model?.data;

        return GenericListSection<DepositCategoryItem>(
          sectionTitle: "account_management".tr,
          pathItems: ["deposit_category".tr],
          addNewTitle: "add_new_deposit_category".tr,
          onAddNewTap: () {Get.dialog(CustomDialogWidget(title: "deposit_category".tr,
              child: CreateNewDepositCategoryWidget()));
          },

          headings: const [ "name",],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) => controller.getDepositCategoryList(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => DepositCategoryItemWidget(index: index, depositCategoryItem: item),
        );
      },
    );
  }
}
