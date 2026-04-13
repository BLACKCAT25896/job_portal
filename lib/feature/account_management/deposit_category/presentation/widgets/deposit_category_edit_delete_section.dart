import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_bottom_sheet.dart';
import 'package:ecommerce/common/widget/edit_delete_bottom_section.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/screen/create_new_deposit_category_screen.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/util/dimensions.dart';

class DepositCategoryEditDeleteSection extends StatelessWidget {
  final DepositCategoryItem? depositCategoryItem;
  const DepositCategoryEditDeleteSection({super.key, this.depositCategoryItem});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeDefault),
      child: EditDeleteBottomSection(edit: (Get.find<ProfileController>().hasPermission("deposit-category-update") && depositCategoryItem?.id != null)? (){
        Get.back();
        Get.to((dynamic widget)=> CreateNewDepositCategoryScreen(depositCategoryItem: widget.depositCategoryItem,));
      } : null,
          delete: (Get.find<ProfileController>().hasPermission("deposit-category-delete") && depositCategoryItem?.id != null)? (){
            Get.back();
            Get.find<DepositCategoryController>().deleteDepositCategory(depositCategoryItem!.id!);
          }: null),
    ));
  }
}
