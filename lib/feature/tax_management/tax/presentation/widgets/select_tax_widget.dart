import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/tax_management/tax/logic/tax_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectTaxWidget extends StatefulWidget {
  const SelectTaxWidget({super.key});

  @override
  State<SelectTaxWidget> createState() => _SelectTaxWidgetState();
}

class _SelectTaxWidgetState extends State<SelectTaxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTitle(title: "tax", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

        GetBuilder<TaxController>(initState: (_) {
            if (Get.find<TaxController>().taxModel == null) {
              Get.find<TaxController>().getTax(1);
            }
          },
          builder: (taxController) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: taxController.taxModel?.data?.data ?? [],
                selectedValue: taxController.selectedTaxItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  taxController.setSelectTaxItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
