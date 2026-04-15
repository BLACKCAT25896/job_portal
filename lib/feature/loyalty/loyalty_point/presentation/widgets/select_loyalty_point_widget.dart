import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/logic/loyalty_point_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectLoyaltyPointWidget extends StatefulWidget {
  const SelectLoyaltyPointWidget({super.key});

  @override
  State<SelectLoyaltyPointWidget> createState() => _SelectLoyaltyPointWidgetState();
}

class _SelectLoyaltyPointWidgetState extends State<SelectLoyaltyPointWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTitle(title: "loyalty_point", leftPadding: 0, fontSize: Dimensions.fontSizeDefault,),

        GetBuilder<LoyaltyPointController>(initState: (_) {
            if (Get.find<LoyaltyPointController>().loyaltyPointModel == null) {
              Get.find<LoyaltyPointController>().getLoyaltyPoint(1);
            }
          },
          builder: (loyaltyPointController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(
                width: Get.width,
                title: "select".tr,
                items: loyaltyPointController.loyaltyPointModel?.data?.data ?? [],
                selectedValue: loyaltyPointController.selectedLoyaltyPointItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  loyaltyPointController.setSelectLoyaltyPointItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
