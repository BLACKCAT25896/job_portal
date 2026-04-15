import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectDesignationWidget extends StatefulWidget {
  const SelectDesignationWidget({super.key});

  @override
  State<SelectDesignationWidget> createState() => _SelectDesignationWidgetState();
}

class _SelectDesignationWidgetState extends State<SelectDesignationWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<DesignationController>();
    if (controller.designationModel == null) {
      controller.getDesignationList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Padding(padding: const EdgeInsets.only(top: 8.0),
           child: Text("designation".tr, style: textRegular)),
        GetBuilder<DesignationController>(builder: (designationController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_designation".tr,
                items: designationController.designationModel?.data?.data ?? [],
                selectedValue: designationController.selectedDesignationItem,
                getLabel: (item) => item.title ?? '',
                onChanged: (val) {
                  if (val != null) {
                    designationController.selectDesignation(val);
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
