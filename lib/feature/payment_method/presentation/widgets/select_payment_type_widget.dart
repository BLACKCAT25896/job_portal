import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectPaymentTypeWidget extends StatefulWidget {
  const SelectPaymentTypeWidget({super.key});

  @override
  State<SelectPaymentTypeWidget> createState() => _SelectPaymentTypeWidgetState();
}

class _SelectPaymentTypeWidgetState extends State<SelectPaymentTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: Dimensions.paddingSizeSmall),
        CustomTitle(title: "payment_type", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),
        GetBuilder<PaymentMethodController>(builder: (paymentTypeController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select".tr,
                items: paymentTypeController.paymentTypes,
                selectedValue: paymentTypeController.selectedPaymentType,
                getLabel: (item) => item.toString(),
                onChanged: (val) {
                  paymentTypeController.setSelectPaymentType(val!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
