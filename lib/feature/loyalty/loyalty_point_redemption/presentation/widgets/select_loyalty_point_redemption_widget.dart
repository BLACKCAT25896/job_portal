import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/logic/loyalty_point_redemption_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectLoyaltyPointRedemptionWidget extends StatefulWidget {
  const SelectLoyaltyPointRedemptionWidget({super.key});

  @override
  State<SelectLoyaltyPointRedemptionWidget> createState() => _SelectLoyaltyPointRedemptionWidgetState();
}

class _SelectLoyaltyPointRedemptionWidgetState extends State<SelectLoyaltyPointRedemptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTitle(title: "loyalty_point_redemption", leftPadding: 0, fontSize: Dimensions.fontSizeDefault,),

        GetBuilder<LoyaltyPointRedemptionController>(initState: (_) {
            if (Get.find<LoyaltyPointRedemptionController>().loyaltyPointRedemptionModel == null) {
              Get.find<LoyaltyPointRedemptionController>().getLoyaltyPointRedemption(1);
            }
          },
          builder: (loyaltyPointRedemptionController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(
                width: Get.width,
                title: "select".tr,
                items: loyaltyPointRedemptionController.loyaltyPointRedemptionModel?.data?.data ?? [],
                selectedValue: loyaltyPointRedemptionController.selectedLoyaltyPointRedemptionItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  loyaltyPointRedemptionController.setSelectLoyaltyPointRedemptionItem(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
