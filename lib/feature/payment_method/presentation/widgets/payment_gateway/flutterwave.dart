// import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';
// import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/common/widget/active_inactive_widget.dart';
// import 'package:ecommerce/common/widget/custom_button.dart';
// import 'package:ecommerce/common/widget/custom_contaner.dart';
// import 'package:ecommerce/common/widget/custom_divider.dart';
// import 'package:ecommerce/common/widget/custom_image.dart';
// import 'package:ecommerce/common/widget/custom_snackbar.dart';
// import 'package:ecommerce/common/widget/custom_text_field.dart';
// import 'package:ecommerce/util/app_constants.dart';
// import 'package:ecommerce/util/dimensions.dart';
// import 'package:ecommerce/util/images.dart';
// import 'package:ecommerce/util/styles.dart';
//
// class FlutterWavePaymentGatewayCardItem extends StatefulWidget {
//   const FlutterWavePaymentGatewayCardItem({super.key});
//
//   @override
//   State<FlutterWavePaymentGatewayCardItem> createState() => _FlutterWavePaymentGatewayCardItemState();
// }
//
// class _FlutterWavePaymentGatewayCardItemState extends State<FlutterWavePaymentGatewayCardItem> {
//
//   TextEditingController publicKeyController = TextEditingController();
//   TextEditingController secretKeyController = TextEditingController();
//   TextEditingController hashController = TextEditingController();
//
//   @override
//   void initState() {
//     final credentials = Get.find<PaymentMethodController>().flutterWavePaymentGatewayItem?.credentials;
//     publicKeyController.text = credentials?.publicKey ?? "";
//     secretKeyController.text = credentials?.secretKey ?? "";
//     hashController.text = credentials?.encryptionKey ?? "";
//
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PaymentMethodController>(builder: (saasPaymentGatewayController) {
//       PaymentMethodItem? paymentGatewayItem = saasPaymentGatewayController.flutterWavePaymentGatewayItem;
//         return paymentGatewayItem != null?
//         CustomContainer(borderRadius: Dimensions.radiusSmall, showShadow: false,
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 spacing: Dimensions.paddingSizeExtraSmall, children: [
//               Row(children: [
//                 Expanded(child: Text('${paymentGatewayItem.name?.toUpperCase().replaceAll("_", " ")}',
//                   style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
//
//                 ActiveInActiveWidget(active: paymentGatewayItem.status == "1",
//                     onChanged: (onChanged){
//                       saasPaymentGatewayController.paymentGatewayStatusUpdate(paymentGatewayItem.id!);
//                     }),
//
//
//               ]),
//               const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//                   child: CustomDivider()),
//
//                const CustomImage( height: 50, image: Images.flutterWave, isLocalAsset: true),
//
//
//               CustomTextField(title: "public_key".tr,
//                 controller: publicKeyController,
//                 hintText: paymentGatewayItem.credentials?.publicKey,),
//
//               CustomTextField(title: "secret_key".tr,
//                 controller: secretKeyController,
//                 hintText: paymentGatewayItem.credentials?.secretKey,),
//
//
//               CustomTextField(title: "encryption_key".tr,
//                 controller: hashController,
//                 hintText: paymentGatewayItem.credentials?.encryptionKey,),
//
//
//               const SizedBox(height: Dimensions.paddingSizeDefault),
//
//               Align(alignment: Alignment.centerRight,
//                   child: CustomButton(width: 100, onTap: (){
//                 String publicKey = publicKeyController.text.trim();
//                 String secretKey = secretKeyController.text.trim();
//                 String hash = hashController.text.trim();
//                 if(publicKey.isEmpty) {
//                   showCustomSnackBar("public_key_is_empty".tr);
//                 }
//                 else if(secretKey.isEmpty) {
//                   showCustomSnackBar("secret_key_is_empty".tr);
//                 }
//                 else if(hash.isEmpty) {
//                   showCustomSnackBar("hash_is_empty".tr);
//                 }
//                 else if(AppConstants.demo) {
//                   showCustomSnackBar(AppConstants.demoModeMessage.tr);
//                 }
//                 else {
//                   saasPaymentGatewayController.editPaymentMethod(
//                       PaymentMethodItem(id: paymentGatewayItem.id,
//                       status: paymentGatewayItem.status,
//                       name: paymentGatewayItem.name,
//                       credentials: Credentials(publicKey: publicKey,
//                           secretKey: secretKey, encryptionKey: hash),
//                   ));
//                 }
//               }, text: "save".tr))
//             ])):const SizedBox();
//       }
//     );
//   }
// }
