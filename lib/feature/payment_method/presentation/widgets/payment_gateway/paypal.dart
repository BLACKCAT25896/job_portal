import 'package:mighty_job/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:mighty_job/feature/payment_method/logic/payment_method_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_divider.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';

class PaypalPaymentGatewayCardItem extends StatefulWidget {
  const PaypalPaymentGatewayCardItem({super.key});

  @override
  State<PaypalPaymentGatewayCardItem> createState() => _PaypalPaymentGatewayCardItemState();
}

class _PaypalPaymentGatewayCardItemState extends State<PaypalPaymentGatewayCardItem> {


  TextEditingController clientIdController = TextEditingController();
  TextEditingController clientSecretController = TextEditingController();

  @override
  void initState() {
    clientIdController.text = Get.find<PaymentMethodController>().payPalPaymentGatewayItem?.credentials?.clientId ?? "";
    clientSecretController.text = Get.find<PaymentMethodController>().payPalPaymentGatewayItem?.credentials?.clientSecret ?? "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.payPalPaymentGatewayItem;
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

              const CustomImage( height: 50, image: Images.payPal, isLocalAsset: true,),


              CustomTextField(title: "client_id".tr,
                controller: clientIdController,
                hintText: paymentGatewayItem.credentials?.clientId,),

              CustomTextField(title: "client_secret".tr,
                controller: clientSecretController,
                hintText: paymentGatewayItem.credentials?.clientSecret,),


              const SizedBox(height: Dimensions.paddingSizeDefault),

              Align(alignment: Alignment.centerRight,
                  child: CustomButton(width: 100, onTap: (){
                String clientId = clientIdController.text.trim();
                String clientSecret = clientSecretController.text.trim();

                if(clientId.isEmpty){
                  showCustomSnackBar("client_id_is_empty".tr);
                } else if(clientSecret.isEmpty){
                  showCustomSnackBar("client_secret_is_empty".tr);
                }else if(AppConstants.demo) {
                  showCustomSnackBar(AppConstants.demoModeMessage.tr);
                }
                else {
                  saasPaymentGatewayController.editPaymentMethod(PaymentMethodItem(
                      id: paymentGatewayItem.id,
                      status: paymentGatewayItem.status,
                      credentials: Credentials(clientId: clientId,
                          clientSecret: clientSecret),
                      name: paymentGatewayItem.name));
                }
              }, text: "save".tr))
            ])):const SizedBox();
      }
    );
  }
}
