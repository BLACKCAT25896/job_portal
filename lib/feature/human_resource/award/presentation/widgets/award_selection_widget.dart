import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/human_resource/award/controller/award_controller.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectAwardWidget extends StatefulWidget {
  const SelectAwardWidget({super.key});

  @override
  State<SelectAwardWidget> createState() => _SelectAwardWidgetState();
}

class _SelectAwardWidgetState extends State<SelectAwardWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<AwardController>();
    if (controller.awardModel == null) {
      controller.getAwardList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "award"),
        GetBuilder<AwardController>(builder: (awardController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_award".tr,
                items: awardController.awardModel?.data?.data ?? [],
                selectedValue: awardController.selectedAwardItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    awardController.selectAward(val);
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
