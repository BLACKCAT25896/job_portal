import 'package:mighty_job/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectSalaryTypeWidget extends StatefulWidget {
  const SelectSalaryTypeWidget({super.key});

  @override
  State<SelectSalaryTypeWidget> createState() => _SelectSalaryTypeWidgetState();
}

class _SelectSalaryTypeWidgetState extends State<SelectSalaryTypeWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<SalaryTypeController>();
    if (controller.salaryTypeModel == null) {
      controller.getSalaryTypeList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("salary_type".tr, style: textRegular)),

        GetBuilder<SalaryTypeController>(builder: (controller) {
            return CustomGenericDropdown(width: Get.width,
              title: "select".tr,
              items: controller.salaryTypeModel?.data?.data ?? [],
              selectedValue: controller.selectedSalaryTypeItem,
              getLabel: (item) => item.name ?? '',
              onChanged: (val) {
                if (val != null) {
                  controller.selectSalaryType(val);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
