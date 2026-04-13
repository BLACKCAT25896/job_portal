

import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/pos/presentation/screen/invoice_print.dart';
import 'package:ecommerce/feature/pos/presentation/screen/invoice_screen.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_element_view.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_product_info_list_widget.dart';
import 'package:ecommerce/helper/pos/invoice_receipt_builder.dart';
import 'package:ecommerce/helper/pos/web_usb_printer_stub.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/network_controller.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/model/invoice_model.dart';
import 'package:ecommerce/feature/profile/domain/model/profile_model.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({super.key});

  @override
  State<InvoiceWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  @override
  void initState() {
    Get.find<SystemSettingsController>().getGeneralSetting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: ResponsiveHelper.isDesktop(context)? 500: Get.width,
      child: GetBuilder<ProfileController>(initState: (val){
        if(Get.find<ProfileController>().profileModel == null) {
          Get.find<ProfileController>().getProfileInfo();
        }
      },
          builder: (profileController) {
            var profile  = profileController.profileModel?.data;
            return GetBuilder<OrderController>(builder: (posController) {
              InvoiceModel? model = posController.invoiceModel;
              Invoice? invoice = model?.data;
              return SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [


                  Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Expanded(flex: 3,child: SizedBox.shrink()),
                      Padding(padding: const EdgeInsets.only(right : Dimensions.paddingSizeSmall,
                          top: Dimensions.paddingSizeSmall),
                        child: InkWell(onTap: () async {
                          if(kIsWeb){
                            final ok = await WebUsbPrinter.connect();
                            if (!ok) {
                              showCustomSnackBar("USB printer not connected");
                              return;
                            }

                            final receipt = InvoiceReceiptBuilder.build(invoice!,
                              name: profile?.name,
                              address: profile?.phone,
                              domain: profile?.phone,
                            );
                            final printed = await WebUsbPrinter.printBytes(receipt.build());

                            if (!printed) {
                              Get.snackbar("Printer", "Print failed");
                            }
                          }else {
                            allowPermission().then((access) {
                              Get.dialog(Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall)),
                                insetPadding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                child: InVoicePrintScreen(),
                              ));
                            });
                          }
                        },
                          child: Container(width: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeSmall,
                                vertical: Dimensions.paddingSizeSmall),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                                Dimensions.paddingSizeExtraSmall),
                                color: systemPrimaryColor()),
                            child: Center(child: Row(children: [
                              Icon(Icons.event_note_outlined, color: Theme.of(context).cardColor,
                                size: 15,),
                              const SizedBox(width: Dimensions.paddingSizeSmall),
                              Text("print".tr, style: textRegular.copyWith(
                                  color: Theme.of(context).cardColor),),
                            ],
                            )),),
                        ),
                      ),

                    ],),
                  ),

                  GetBuilder<ProfileController>(builder: (settingController) {
                    ProfileItem? setting = settingController.profileModel?.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

                        Text(setting?.name??'N/A', style: textMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraLargeTwenty),),

                        Text(setting?.phone??'',
                          textAlign: TextAlign.center, style: textRegular.copyWith(),),

                        Text('${"address".tr} : ${setting?.phone??''}',
                          style: textRegular.copyWith(),),

                        const SizedBox(height: Dimensions.paddingSizeExtraSmall),


                      ],),
                    );
                  }
                  ),


                  Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      CustomDivider(color: Theme.of(context).hintColor),


                      InvoiceElementView(title: "product".tr, quantity: "qty".tr, price: "price".tr,
                          isBold: true),
                      const SizedBox(height: Dimensions.paddingSizeDefault),

                      InvoiceProductInfoListWidget(invoice),


                      CustomDivider(color: Theme.of(context).hintColor),


                      Column(children: [

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text("discount".tr, style: textRegular.copyWith(),),
                          Text(PriceConverter.convertPrice(context, invoice?.discount??0)),
                        ],),
                        const SizedBox(height: Dimensions.paddingSizeSmall),


                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text("tax".tr, style: textRegular.copyWith(),),
                          Text(' + ${PriceConverter.convertPrice(context, invoice?.tax??0)}'),
                        ],),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                      ],),

                      Padding(padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeExtraSmall),
                        child: CustomDivider(color: Theme.of(context).hintColor),),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Text("total".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
                        Text(PriceConverter.convertPrice(context, (invoice?.grandTotal??0)),
                            style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                      ],),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      Text("${"date".tr}: ${DateConverter.quotationDate(DateTime.parse(invoice?.orderDate??
                          DateTime.now().toString()))}", style: textRegular),
                      if(Get.find<NetworkController>().isOnline)
                        Text('${"invoice".tr} # ${invoice?.orderNumber}',
                            style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

                      Text('"""${"thank_you".tr}"""', style: textRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall)),

                      SizedBox(height: Dimensions.paddingSizeLarge),
                    ],),
                  )
                ]),
              );
            }
            );
          }
      ),
    );
  }
}
