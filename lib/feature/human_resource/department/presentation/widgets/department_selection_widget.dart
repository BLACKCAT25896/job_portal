import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/human_resource/department/controller/department_controller.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectDepartmentWidget extends StatefulWidget {
  const SelectDepartmentWidget({super.key});

  @override
  State<SelectDepartmentWidget> createState() => _SelectDepartmentWidgetState();
}

class _SelectDepartmentWidgetState extends State<SelectDepartmentWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<DepartmentController>();
    if (controller.departmentModel == null) {
      controller.getDepartmentList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Padding(padding: const EdgeInsets.only(top: 8.0),
           child: Text("department".tr, style: textRegular,)),
        GetBuilder<DepartmentController>(builder: (departmentController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_department".tr,
                items: departmentController.departmentModel?.data?.data ?? [],
                selectedValue: departmentController.selectedDepartmentItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    departmentController.selectDepartment(val);
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
