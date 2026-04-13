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

class BkashPaymentGatewayCardItem extends StatefulWidget {
  const BkashPaymentGatewayCardItem({super.key});

  @override
  State<BkashPaymentGatewayCardItem> createState() => _BkashPaymentGatewayCardItemState();
}

class _BkashPaymentGatewayCardItemState extends State<BkashPaymentGatewayCardItem> {


  TextEditingController appKeyController = TextEditingController();
  TextEditingController appSecretKeyController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController callBackUrlController = TextEditingController();


  @override
  void initState() {
    final paymentInfo = Get.find<PaymentMethodController>().bKashPaymentGatewayItem?.credentials;
    appKeyController.text = paymentInfo?.appKey ?? "";
    appSecretKeyController.text = paymentInfo?.appSecret ?? "";
    userNameController.text = paymentInfo?.username ?? "";
    passwordController.text = paymentInfo?.password ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
        PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.bKashPaymentGatewayItem;
        return paymentGatewayItem != null?
        CustomContainer(borderRadius: Dimensions.radiusSmall, showShadow: false,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeExtraSmall, children: [
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

               CustomContainer(color: Theme.of(context).hintColor,
                   child: CustomImage( height: 50, image: Images.bKash, isLocalAsset: true,)),


              CustomTextField(title: "app_key".tr,
                controller: appKeyController,
                hintText: paymentGatewayItem.credentials?.appKey,),

              CustomTextField(title: "app_secret".tr,
                controller: appSecretKeyController,
                hintText: paymentGatewayItem.credentials?.appSecret,),



              CustomTextField(title: "user_name".tr,
                controller: userNameController,
                hintText: paymentGatewayItem.credentials?.username,),

              CustomTextField(title: "password".tr,
                controller: passwordController,
                hintText: paymentGatewayItem.credentials?.password),



              const SizedBox(height: Dimensions.paddingSizeDefault),

              Align(alignment: Alignment.centerRight, child: CustomButton(width: 100, onTap: (){
                String appKey = appKeyController.text.trim();
                String appSecretKey = appSecretKeyController.text.trim();
                String userName = userNameController.text.trim();
                String password = passwordController.text.trim();
                if(appKey.isEmpty){
                  showCustomSnackBar("app_key_is_empty".tr);
                }
                else if(appSecretKey.isEmpty){
                  showCustomSnackBar("app_secret_is_empty".tr);
                }
                else if(userName.isEmpty){
                  showCustomSnackBar("user_name_is_empty".tr);
                }

                else if(password.isEmpty){
                  showCustomSnackBar("password_is_empty".tr);
                }

                else if(AppConstants.demo) {
                  showCustomSnackBar(AppConstants.demoModeMessage.tr);
                }
                else{
                  saasPaymentGatewayController.editPaymentMethod(
                      PaymentMethodItem(id: paymentGatewayItem.id,
                      status: paymentGatewayItem.status,
                      name: paymentGatewayItem.name,
                      credentials: Credentials(appKey: appKey,
                          appSecret: appSecretKey,
                          username: userName,
                          password: password)));
                }
              }, text: "save".tr))
            ])): const SizedBox();
      }
    );
  }
}
