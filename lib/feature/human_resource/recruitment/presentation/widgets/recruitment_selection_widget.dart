import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectRecruitmentWidget extends StatefulWidget {
  const SelectRecruitmentWidget({super.key});

  @override
  State<SelectRecruitmentWidget> createState() => _SelectRecruitmentWidgetState();
}

class _SelectRecruitmentWidgetState extends State<SelectRecruitmentWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<RecruitmentController>();
    if (controller.recruitmentModel == null) {
      controller.getRecruitmentList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Text("recruitment".tr, style: textRegular)),

        GetBuilder<RecruitmentController>(builder: (recruitmentController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_recruitment".tr,
                items: recruitmentController.recruitmentModel?.data?.data ?? [],
                selectedValue: recruitmentController.selectedRecruitmentItem,
                getLabel: (item) => item.title ?? '',
                onChanged: (val) {
                  if (val != null) {
                    recruitmentController.selectRecruitment(val);
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
