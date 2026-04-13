// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:restaurant/common/widget/active_inactive_widget.dart';
// import 'package:restaurant/common/widget/custom_button.dart';
// import 'package:restaurant/common/widget/custom_contaner.dart';
// import 'package:restaurant/common/widget/custom_divider.dart';
// import 'package:restaurant/common/widget/custom_image.dart';
// import 'package:restaurant/common/widget/custom_snackbar.dart';
// import 'package:restaurant/common/widget/custom_text_field.dart';
// import 'package:restaurant/feature/payment_gateway/domain/model/payment_gateway_model.dart';
// import 'package:restaurant/feature/payment_gateway/logic/payment_gateway_controller.dart';
// import 'package:restaurant/util/app_constants.dart';
// import 'package:restaurant/util/dimensions.dart';
// import 'package:restaurant/util/images.dart';
// import 'package:restaurant/util/styles.dart';
//
// class SenangPayPaymentGatewayCardItem extends StatefulWidget {
//   const SenangPayPaymentGatewayCardItem({super.key});
//
//   @override
//   State<SenangPayPaymentGatewayCardItem> createState() => _SenangPayPaymentGatewayCardItemState();
// }
//
// class _SenangPayPaymentGatewayCardItemState extends State<SenangPayPaymentGatewayCardItem> {
//
//   TextEditingController merchantIdController = TextEditingController();
//   TextEditingController secretKeyController = TextEditingController();
//
//   @override
//   void initState() {
//     merchantIdController.text = Get.find<PaymentGatewayController>().senangPayPaymentGatewayItem?.paymentInfo?.merchantId ?? "";
//     secretKeyController.text = Get.find<PaymentGatewayController>().senangPayPaymentGatewayItem?.paymentInfo?.secretKey ?? "";
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PaymentGatewayController>(
//       builder: (saasPaymentGatewayController) {
//         PaymentGatewayItem? paymentGatewayItem = saasPaymentGatewayController.senangPayPaymentGatewayItem;
//         return paymentGatewayItem != null?
//         CustomContainer(borderRadius: Dimensions.radiusSmall, showShadow: false,
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeExtraSmall, children: [
//               Row(children: [
//                 Expanded(child: Text('${paymentGatewayItem.name?.toUpperCase().replaceAll("_", " ")}',
//                   style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
//                 ActiveInActiveWidget(active: paymentGatewayItem.status == "1",
//                     onChanged: (onChanged){
//                       saasPaymentGatewayController.paymentGatewayStatusUpdate(paymentGatewayItem.id!);
//                     }),
//               ]),
//               const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//                   child: CustomDivider()),
//
//               const CustomImage( height: 50, image: Images.senangPay, isLocalAsset: true,),
//
//
//               CustomTextField(title: "merchant_id".tr,
//                 controller: merchantIdController,
//                 hintText: paymentGatewayItem.paymentInfo?.merchantId,),
//
//               CustomTextField(title: "secret_key".tr,
//                 controller: secretKeyController,
//                 hintText: paymentGatewayItem.paymentInfo?.secretKey,),
//
//
//
//               const SizedBox(height: Dimensions.paddingSizeDefault),
//
//               Align(alignment: Alignment.centerRight, child: CustomButton(width: 100, onTap: (){
//                 String merchantId = merchantIdController.text.trim();
//                 String secretKey = secretKeyController.text.trim();
//
//                 if(merchantId.isEmpty) {
//                   showCustomSnackBar("merchant_id_is_empty".tr);
//                 }
//                 if(secretKey.isEmpty) {
//                   showCustomSnackBar("secret_key_is_empty".tr);
//                 } else if(AppConstants.demo) {
//                   showCustomSnackBar(AppConstants.demoModeMessage.tr);
//                 }
//                 else{
//                   saasPaymentGatewayController.editSaasPaymentGateway(PaymentGatewayItem(id: paymentGatewayItem.id,
//                       status: paymentGatewayItem.status,
//                       name: paymentGatewayItem.name,
//                       paymentInfo: PaymentInfo(merchantId: merchantId, secretKey: secretKey)));
//                 }
//
//               }, text: "save".tr))
//             ])): const SizedBox();
//       }
//     );
//   }
// }
