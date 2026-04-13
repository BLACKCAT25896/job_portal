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

class SslCommerzPaymentGatewayCardItem extends StatefulWidget {
  const SslCommerzPaymentGatewayCardItem({super.key});

  @override
  State<SslCommerzPaymentGatewayCardItem> createState() => _SslCommerzPaymentGatewayCardItemState();
}

class _SslCommerzPaymentGatewayCardItemState extends State<SslCommerzPaymentGatewayCardItem> {
  TextEditingController storeIdController = TextEditingController();
  TextEditingController storePasswordController = TextEditingController();

  @override
  void initState() {
    final paymentInfo = Get.find<PaymentMethodController>().sslCommerzPaymentGatewayItem?.credentials;
    storeIdController.text = paymentInfo?.storeId ?? "";
    storePasswordController.text = paymentInfo?.storePassword ?? "";
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.sslCommerzPaymentGatewayItem;
        return paymentGatewayItem != null?
        CustomContainer(borderRadius: Dimensions.radiusSmall, showShadow: false,
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

              const CustomImage( height: 50, image: Images.sslCommerz, isLocalAsset: true,),


              CustomTextField(title: "store_id".tr,
                controller: storeIdController,
                hintText: paymentGatewayItem.credentials?.storeId,),

              CustomTextField(title: "store_password".tr,
                controller: storePasswordController,
                hintText: paymentGatewayItem.credentials?.storePassword,),



              const SizedBox(height: Dimensions.paddingSizeDefault),

              Align(alignment: Alignment.centerRight, child: CustomButton(width: 100, onTap: (){
                String storeId = storeIdController.text.trim();
                String storePassword = storePasswordController.text.trim();

                if(storeId.isEmpty) {
                  showCustomSnackBar("store_id_is_empty".tr);
                } else if(storePassword.isEmpty) {
                  showCustomSnackBar("store_password_is_empty".tr);
                } else if(AppConstants.demo) {
                  showCustomSnackBar(AppConstants.demoModeMessage.tr);
                }else {
                  saasPaymentGatewayController.editPaymentMethod(
                      PaymentMethodItem(id: paymentGatewayItem.id,
                      name: paymentGatewayItem.name,
                      status: paymentGatewayItem.status,
                      credentials: Credentials(storeId: storeId,
                          storePassword: storePassword)));
                }
              }, text: "save".tr))
            ])):const SizedBox();
      }
    );
  }
}
