import 'package:ecommerce/common/widget/custom_dropdown.dart';
import 'package:ecommerce/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectJobTypeWidget extends StatefulWidget {
  const SelectJobTypeWidget({super.key});

  @override
  State<SelectJobTypeWidget> createState() => _SelectJobTypeWidgetState();
}

class _SelectJobTypeWidgetState extends State<SelectJobTypeWidget> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecruitmentController>(builder: (controller) {
      return Column(children: [
        const SizedBox(height: Dimensions.paddingSizeSmall),
        CustomTitle(title: "job_type", leftPadding: 0, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500),

        const SizedBox(height: 8,),
        CustomDropdown(width: Get.width, title: "select".tr,
          items: controller.jobTypes,
          selectedValue: controller.selectedJobType,
          onChanged: (val){
          controller.selectJobType(val!);
          },
        ),
      ],);
    });
  }
}
