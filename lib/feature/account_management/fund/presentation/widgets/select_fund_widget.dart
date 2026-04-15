import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/account_management/fund/logic/fund_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectFundWidget extends StatefulWidget {
  const SelectFundWidget({super.key});

  @override
  State<SelectFundWidget> createState() => _SelectFundWidgetState();
}

class _SelectFundWidgetState extends State<SelectFundWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: Dimensions.paddingSizeDefault),
      CustomTitle(title: "fund", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<FundController>(initState: (_) {
        if (Get.find<FundController>().fundModel == null) {
          Get.find<FundController>().getFund(1);
        }},
        builder: (expanseCategoryController) {
          return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomGenericDropdown(width: Get.width, title: "select".tr,
              items: expanseCategoryController.fundModel?.data?.data ?? [],
              selectedValue: expanseCategoryController.selectedFundItem,
              getLabel: (item) => item.name ?? '',
              onChanged: (val) {
                expanseCategoryController.setSelectFundItem(val!);
              },
            ),
          );
        },
      ),
    ],
    );
  }
}
