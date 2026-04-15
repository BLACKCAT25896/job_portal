import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:mighty_job/util/dimensions.dart';

class DepositCategorySelectionWidget extends StatefulWidget {
  final String? title;
  const DepositCategorySelectionWidget({super.key, this.title});

  @override
  State<DepositCategorySelectionWidget> createState() => _DepositCategorySelectionWidgetState();
}

class _DepositCategorySelectionWidgetState extends State<DepositCategorySelectionWidget> {
  @override
  void initState() {
    if(Get.find<DepositCategoryController>().depositCategoryModel == null){
      Get.find<DepositCategoryController>().getDepositCategoryList(1);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositCategoryController>(
      builder: (depositCategoryController) {
        return Column(children: [
          const SizedBox(height: Dimensions.paddingSizeSmall),
           CustomTitle(title: widget.title ?? "category", leftPadding: 0, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500),

          const SizedBox(height: 8,),
          CustomGenericDropdown(width: Get.width, title: "select".tr,
            items: depositCategoryController.depositCategoryModel?.data?.data??[],
            selectedValue: depositCategoryController.selectedCategory,
            onChanged: (val){
              depositCategoryController.setSelectedCategory(val!);
            }, getLabel: (item) => item.name ?? '',
          ),
        ],);
      }
    );
  }
}
