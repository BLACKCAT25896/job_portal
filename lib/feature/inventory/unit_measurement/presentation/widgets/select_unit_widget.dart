import 'package:mighty_job/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectUnitWidget extends StatefulWidget {
  const SelectUnitWidget({super.key});

  @override
  State<SelectUnitWidget> createState() => _SelectUnitWidgetState();
}

class _SelectUnitWidgetState extends State<SelectUnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: Dimensions.paddingSizeDefault),
        CustomTitle(title: "unit", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),
        GetBuilder<UnitController>(initState: (_) {
            if (Get.find<UnitController>().unitModel == null) {
              Get.find<UnitController>().getUnit(1);
            }
          }, builder: (unitController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: unitController.unitModel?.data?.data ?? [],
                selectedValue: unitController.selectedUnitItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  unitController.setSelectUnitItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}



