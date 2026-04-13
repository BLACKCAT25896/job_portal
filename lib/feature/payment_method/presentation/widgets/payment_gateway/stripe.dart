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

class StripePaymentGatewayCardItem extends StatefulWidget {
  const StripePaymentGatewayCardItem({super.key});

  @override
  State<StripePaymentGatewayCardItem> createState() => _StripePaymentGatewayCardItemState();
}

class _StripePaymentGatewayCardItemState extends State<StripePaymentGatewayCardItem> {

  TextEditingController apiKeyController = TextEditingController();
  TextEditingController publishedKeyController = TextEditingController();

  @override
  void initState() {
    final paymentInfo = Get.find<PaymentMethodController>().stripePaymentGatewayItem?.credentials;
    apiKeyController.text = paymentInfo?.apiKey ?? "";
    publishedKeyController.text = paymentInfo?.publishedKey ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.stripePaymentGatewayItem;
        return paymentGatewayItem != null?
        CustomContainer(borderRadius: Dimensions.radiusSmall,
            showShadow: false,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeExtraSmall, children: [
              Row(children: [
                Expanded(child: Text('${paymentGatewayItem.name?.toUpperCase().replaceAll("_", " ")}', style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
                ActiveInActiveWidget(active: paymentGatewayItem.status == "1",
                    onChanged: (onChanged){
                      saasPaymentGatewayController.paymentGatewayStatusUpdate(paymentGatewayItem.id!);
                    }),
              ]),
              const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                  child: CustomDivider()),

              const CustomImage( height: 50, image: Images.stripe, isLocalAsset: true,),


              CustomTextField(title: "api_key".tr,
                controller: apiKeyController,
                hintText: paymentGatewayItem.credentials?.apiKey,),

              CustomTextField(title: "published_key".tr,
                controller: publishedKeyController,
                hintText: paymentGatewayItem.credentials?.publishedKey,),


              const SizedBox(height: Dimensions.paddingSizeDefault),

              Align(alignment: Alignment.centerRight, child: CustomButton(width: 100, onTap: (){
                String apiKey = apiKeyController.text.trim();
                String publishedKey = publishedKeyController.text.trim();
                if(apiKey.isEmpty) {
                  showCustomSnackBar("api_key_is_empty".tr);
                } else if(publishedKey.isEmpty) {
                  showCustomSnackBar("published_key_is_empty".tr);
                }else if(AppConstants.demo) {
                  showCustomSnackBar(AppConstants.demoModeMessage.tr);
                }
                else {

                  saasPaymentGatewayController.editPaymentMethod(
                      PaymentMethodItem(id: paymentGatewayItem.id,
                      status: paymentGatewayItem.status,
                      credentials: Credentials(apiKey: apiKey,
                          publishedKey: publishedKey),
                     ));
                }
              }, text: "save".tr))
            ])):const SizedBox();
      }
    );
  }
}
