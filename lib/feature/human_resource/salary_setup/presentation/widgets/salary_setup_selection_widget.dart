import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';
import 'package:mighty_job/feature/human_resource/salary_Setup/controller/salary_Setup_controller.dart';

class SelectSalarySetupWidget extends StatefulWidget {
  const SelectSalarySetupWidget({super.key});

  @override
  State<SelectSalarySetupWidget> createState() => _SelectSalarySetupWidgetState();
}

class _SelectSalarySetupWidgetState extends State<SelectSalarySetupWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<SalarySetupController>();
    if (controller.salarySetupModel == null) {
      controller.getSalarySetupList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "salary_setup"),
        GetBuilder<SalarySetupController>(builder: (salarySetupController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_salary_setup".tr,
                items: salarySetupController.salarySetupModel?.data?.data ?? [],
                selectedValue: salarySetupController.selectedSalarySetupItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    salarySetupController.selectSalarySetup(val);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
