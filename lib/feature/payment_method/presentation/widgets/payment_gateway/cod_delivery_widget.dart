import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class CodDeliveryWidget extends StatelessWidget {
  const CodDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (paymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = paymentGatewayController.codPaymentGatewayItem;
        return paymentGatewayItem != null?
        CustomContainer(showShadow: false,borderRadius: 5,
          child: Row(children: [
            Expanded(child: Text('${paymentGatewayItem.name?.toUpperCase().replaceAll("_", " ")}',
              style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

            ActiveInActiveWidget(active: paymentGatewayItem.status == "1",
                onChanged: (onChanged){
                  paymentGatewayController.paymentGatewayStatusUpdate(paymentGatewayItem.id!);
                }),


          ]),
        ):SizedBox();
      }
    );
  }
}
