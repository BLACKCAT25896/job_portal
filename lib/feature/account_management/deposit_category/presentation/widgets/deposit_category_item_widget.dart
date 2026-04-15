import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:mighty_job/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:mighty_job/feature/account_management/deposit_category/presentation/widgets/create_new_deposit_category_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

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

