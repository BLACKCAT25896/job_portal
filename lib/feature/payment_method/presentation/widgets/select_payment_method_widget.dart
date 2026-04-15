import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/payment_method/logic/payment_method_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectPaymentMethodWidget extends StatefulWidget {
  const SelectPaymentMethodWidget({super.key});

  @override
  State<SelectPaymentMethodWidget> createState() => _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          child: CustomTitle(title: "payment_method",
            leftPadding: 0, fontSize: Dimensions.fontSizeDefault)),

        GetBuilder<PaymentMethodController>(initState: (_) {
            if (Get.find<PaymentMethodController>().paymentMethod == null) {
              Get.find<PaymentMethodController>().getPaymentMethod(1);
            }
          },
          builder: (foodController) {
            return CustomGenericDropdown(
              width: Get.width,
              title: "select".tr,
              items: foodController.paymentMethod?.data?.data ?? [],
              selectedValue: foodController.selectedPaymentMethodItem,
              getLabel: (item) => item.name ?? '',
              onChanged: (val) {
                foodController.setSelectPaymentMethodItem(val!);
              },
            );
          },
        ),
      ],
    );
  }
}
