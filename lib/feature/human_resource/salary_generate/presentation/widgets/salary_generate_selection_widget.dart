import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/controller/salary_Generate_controller.dart';

class SelectSalaryGenerateWidget extends StatefulWidget {
  const SelectSalaryGenerateWidget({super.key});

  @override
  State<SelectSalaryGenerateWidget> createState() => _SelectSalaryGenerateWidgetState();
}

class _SelectSalaryGenerateWidgetState extends State<SelectSalaryGenerateWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<SalaryGenerateController>();
    if (controller.salaryGenerateModel == null) {
      controller.getSalaryGenerateList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "salary_generate"),
        GetBuilder<SalaryGenerateController>(builder: (salaryGenerateController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_salary_generate".tr,
                items: salaryGenerateController.salaryGenerateModel?.data?.data ?? [],
                selectedValue: salaryGenerateController.selectedSalaryGenerateItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    salaryGenerateController.selectSalaryGenerate(val);
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
