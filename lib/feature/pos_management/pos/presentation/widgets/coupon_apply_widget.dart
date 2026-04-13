import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
class CouponDialog extends StatelessWidget {
  const CouponDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      child: GetBuilder<CartController>(
          builder: (cartController) {
            return Container(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              height: 250,child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [

                CustomTextField(hintText: 'coupon_code_hint'.tr,
                  controller:cartController.couponController,
                  title: 'coupon_code'.tr,
                )
,


                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Row(children: [
                    Expanded(child: CustomButton(text: 'cancel'.tr,
                        buttonColor: Theme.of(context).hintColor,
                        textColor: systemPrimaryColor(),
                        onTap: ()=>Get.back())),
                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Expanded(child: CustomButton(text: 'apply'.tr,onTap: (){
                      if(cartController.couponController.text.trim().isNotEmpty){
                       // cartController.getCouponDiscount(cartController.couponController.text.trim(),Get.find<CustomerController>().customerList[(Get.find<CustomerController>().customerIds.indexOf(Get.find<CustomerController>().customerIndex))].id, cartController.amount  );
                      }

                      Get.back();
                    },)),
                  ],),
                )
              ],),);
          }
      ),
    );
  }
}
