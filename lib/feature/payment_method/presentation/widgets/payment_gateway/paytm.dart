import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class PaytmPaymentGatewayCardItem extends StatefulWidget {
  const PaytmPaymentGatewayCardItem({super.key});

  @override
  State<PaytmPaymentGatewayCardItem> createState() => _PaytmPaymentGatewayCardItemState();
}

class _PaytmPaymentGatewayCardItemState extends State<PaytmPaymentGatewayCardItem> {

  TextEditingController merchantKeyController = TextEditingController();
  TextEditingController merchantIdController = TextEditingController();
  TextEditingController merchantWebsiteLinkController = TextEditingController();

  @override
  void initState() {
    final paymentInfo = Get.find<PaymentMethodController>().payTmPaymentGatewayItem?.credentials;
    merchantKeyController.text = paymentInfo?.merchantKey ?? "";
    merchantIdController.text = paymentInfo?.merchantId ?? "";
    merchantWebsiteLinkController.text = paymentInfo?.merchantWebsiteLink ?? "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.payTmPaymentGatewayItem;
        return paymentGatewayItem != null?
        CustomContainer(borderRadius: Dimensions.radiusSmall, showShadow: false,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeExtraSmall, children: [
              Row(children: [
                Expanded(child: Text('${paymentGatewayItem.name?.toUpperCase().replaceAll("_", " ")}',
                  style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
                ActiveInActiveWidget(active: paymentGatewayItem.status == "1",
                    onChanged: (onChanged){
                      saasPaymentGatewayController.paymentGatewayStatusUpdate(paymentGatewayItem.id!);
                    }),
              ]),
              const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                  child: CustomDivider()),

              const CustomImage( height: 30, image: Images.payTm, isLocalAsset: true,),


              CustomTextField(title: "merchant_key".tr,
                controller: merchantKeyController,
                hintText: paymentGatewayItem.credentials?.merchantKey,),

              CustomTextField(title: "merchant_id".tr,
                controller: merchantIdController,
                hintText: paymentGatewayItem.credentials?.merchantId,),


              CustomTextField(title: "merchant_website_link".tr,
                controller: merchantWebsiteLinkController,
                hintText: paymentGatewayItem.credentials?.merchantWebsiteLink,),


              const SizedBox(height: Dimensions.paddingSizeDefault),

              Align(alignment: Alignment.centerRight, child: CustomButton(width: 100, onTap: (){
                String merchantKey = merchantKeyController.text.trim();
                String merchantId = merchantIdController.text.trim();
                String merchantWebsiteLink = merchantWebsiteLinkController.text.trim();

               if(merchantKey.isEmpty){
                  showCustomSnackBar("merchant_key_is_empty".tr);
                }
                else if(merchantId.isEmpty){
                  showCustomSnackBar("merchant_id_is_empty".tr);
                }
                else if(merchantWebsiteLink.isEmpty){
                  showCustomSnackBar("merchant_website_link_is_empty".tr);
                }else if(AppConstants.demo) {
                 showCustomSnackBar(AppConstants.demoModeMessage.tr);
               }
                else{
                  saasPaymentGatewayController.editPaymentMethod(
                      PaymentMethodItem(id: paymentGatewayItem.id,
                      status: paymentGatewayItem.status,
                      name: paymentGatewayItem.name,
                      credentials: Credentials(merchantKey: merchantKey,
                          merchantId: merchantId,
                          merchantWebsiteLink: merchantWebsiteLink)));
                }
              }, text: "save".tr))
            ])):const SizedBox();
      }
    );
  }
}
