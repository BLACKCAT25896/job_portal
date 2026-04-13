import 'package:ecommerce/feature/order_management/order/domain/model/order_body.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/common/widget/frontend_custom_button.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class GoToCheckoutWidget extends StatelessWidget {
  const GoToCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        return CustomContainer(borderRadius: 0,
          child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(spacing: Dimensions.paddingSizeSmall,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CustomRow(title: "total".tr, details:  PriceConverter.convertPrice(context, cartController.totalPrice)),
              Text("see_summery".tr, style: textRegular.copyWith(color: Theme.of(context).hintColor)),
              FrontendCustomButton(onTap: (){
              List<OrderItems> items = [];

              for(int i = 0; i < cartController.selectedItems.length; i++){
              OrderItems orderItem = OrderItems(
              productItemId: cartController.selectedItems[i].id,
              quantity: cartController.selectedItems[i].quantity,
              price: cartController.selectedItems[i].defaultVariant?.price,
              productVariantId: cartController.selectedItems[i].id);
              items.add(orderItem);

              }

              OrderBody body = OrderBody(
              paymentMethodId: 1,
              paymentStatus: false,
              discount: "0",
              tax: "0",
              items: items,
              grandTotal: cartController.totalPrice.toString(),
              );
              Get.find<OrderController>().createOrder(body);

              }, text: "go_to_checkout".tr)
            ]),
          ),
        );
      }
    );
  }
}
