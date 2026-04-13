import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/cart/presentation/widget/pos_cart_list_widget.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_body.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class PosCartWidget extends StatefulWidget {
  const PosCartWidget({super.key});

  @override
  State<PosCartWidget> createState() => _PosCartWidgetState();
}

class _PosCartWidgetState extends State<PosCartWidget> {
  TextEditingController serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
        return Column(children: [
          SizedBox(height: Get.height- 365,
            child: PosCartListWidget()),



          CustomContainer(showShadow: false,borderRadius: 0,verticalPadding: 0,
              color: Theme.of(context).hintColor.withValues(alpha: .125),
              horizontalPadding: 0,
              child: Column(spacing: Dimensions.paddingSizeExtraSmall, children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: Column(spacing: Dimensions.paddingSizeExtraSmall, children: [
                  SizedBox(height: Dimensions.paddingSizeSmall),
                  CustomRow(title: "subtotal".tr,
                      details: PriceConverter.convertPrice(context, cartController.totalPrice)),
                  CustomRow(title: "vat_tax".tr,
                      details: PriceConverter.convertPrice(context, 0)),
                  CustomRow(title: "grand_total".tr,
                      details: PriceConverter.convertPrice(context, cartController.totalPrice)),

                ]),
              ),
              GetBuilder<OrderController>(
                builder: (controller) {
                  return CustomContainer(borderRadius: 0,showShadow: false,
                    horizontalPadding: 0,
                    child: Row(spacing: Dimensions.paddingSizeExtraSmall, children: [

                      CustomContainer(showShadow: false,
                          borderRadius: 3, verticalPadding: 5, horizontalPadding: 15,
                          color: Theme.of(context).colorScheme.error,
                          child: Text("cancel".tr,
                              style: textRegular.copyWith(color: Colors.white)),
                          onTap: (){
                        Get.back();
                          }),




                      Expanded(child: controller.isLoading?
                          Center(child: CircularProgressIndicator()):
                      CustomContainer(showShadow: false,
                          color: systemPrimaryColor(),
                          verticalPadding: 5, horizontalPadding: 5,borderRadius: 3,
                          child: Center(child: Text("place_order".tr,
                              style: textRegular.copyWith(color: Colors.white))),
                          onTap: (){
                        int? paymentMethodId = Get.find<PaymentMethodController>().selectedPaymentMethodItem?.id;
                        CustomerItem? customer = Get.find<CustomerController>().selectedCustomerItem;

                        List<OrderItems> items = [];

                            for(int i = 0; i < cartController.selectedItems.length; i++){
                              OrderItems orderItem = OrderItems(

                                  productItemId: cartController.selectedItems[i].id,
                                  quantity: cartController.selectedItems[i].quantity,
                                  price: cartController.selectedItems[i].variants?.first.price,
                                  productVariantId: cartController.selectedItems[i].id);
                              items.add(orderItem);

                            }
                        if(items.isEmpty){
                          showCustomSnackBar("select_at_least_one_item".tr);
                        }else if(paymentMethodId == null){
                          showCustomSnackBar("select_payment_method".tr);
                        }else {
                          OrderBody body = OrderBody(
                            paymentMethodId: paymentMethodId,
                            paymentStatus: false,
                            discount: "0",
                            customerName: customer?.name,
                            customerPhone: customer?.phone,
                            deliveryAddress: customer?.address,
                            orderSource: "pos",
                            tax: "0",
                            items: items,
                            grandTotal: cartController.totalPrice.toString(),
                          );

                          Get.find<OrderController>().createOrder(body);
                        }

                          })),

                    ]),
                  );
                }
              )

            ],
          )),


        ]);
      }
    );
  }
}
