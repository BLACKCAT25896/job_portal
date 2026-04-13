import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/create_new_deposit_category_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class DepositCategoryItemWidget extends StatelessWidget {
  final DepositCategoryItem? depositCategoryItem;
  final int index;
  const DepositCategoryItemWidget({super.key, this.depositCategoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: Text(depositCategoryItem?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))),

      EditDeletePopupMenu(onEdit: () {
          Get.dialog(CustomDialogWidget(title: "deposit_category".tr,
              child: CreateNewDepositCategoryWidget(depositCategoryItem: depositCategoryItem)));
        },
        onDelete: () {
          Get.dialog(ConfirmationDialog(title: "deposit_category",
            onTap: () => Get.find<DepositCategoryController>().deleteDepositCategory(depositCategoryItem!.id!)),
          );
        },
      )
      ]);
  }
}

