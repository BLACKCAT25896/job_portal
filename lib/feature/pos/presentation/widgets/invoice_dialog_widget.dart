
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_element_view.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/model/invoice_model.dart';
import 'package:ecommerce/feature/profile/domain/model/profile_model.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class InvoiceDialogWidget extends StatelessWidget {
  final ScreenshotController screenshotController;
  const InvoiceDialogWidget({super.key, required this.screenshotController});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (posController) {
      Invoice? invoice = posController.invoiceModel?.data;
      return Screenshot(controller: screenshotController,
           child: Column(children: [
             GetBuilder<ProfileController>(builder: (profileController) {
               ProfileItem? setting = profileController.profileModel?.data;
               return Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

                   Text('Shop', style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLargeTwenty),),
                   if(setting?.phone != null)
                     Text('${"phone".tr} : ${setting?.phone??''}',
                       style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
                   if(setting?.email != null)
                     Text('${"email".tr} : ${setting?.email??''}',
                       style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
                        //if(setting?.defaultShopDetail?.address != null)
                       // Text('${"address".tr} : ${setting?.defaultShopDetail?.address??''}',
                   // textAlign: TextAlign.center, style: textSemiBold.copyWith(),),

                   const SizedBox(height: Dimensions.paddingSizeExtraSmall),


                 ]));
             }),

             Padding(padding: const EdgeInsets.symmetric(vertical : Dimensions.paddingSizeDefault, horizontal: 5),
               child: Column(children: [
                 Divider(),
                 InvoiceElementView(title: "product".tr, quantity: "qty".tr, price: "price".tr, isBold: true),
                  Divider(),
                 ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (con, index){
                      Items? sale = invoice?.items?[index];
                      return Padding(padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10),
                          child: Row(children: [
                            Expanded(flex: 5,
                                child:  Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                                  Expanded(child: Text('Name will be there',
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),))
                                ])),
                            const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                            Expanded(flex: 3,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Text(sale?.quantity?.toStringAsFixed(0)??'',
                                    style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                                const SizedBox(width: Dimensions.paddingSizeDefault),
                                Text(PriceConverter.convertPrice(context, (sale?.price??0)),
                                  style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                              ],),
                            ),
                          ],)
                      );
                    },
                    itemCount: invoice?.items?.length??0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),

                  Divider(),


                  Column(children: [

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Text("discount".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                      Text(PriceConverter.convertPrice(context, invoice?.discount??0), style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                    ],),
                    const SizedBox(height: Dimensions.paddingSizeSmall),


                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Text("tax".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                      Text(' + ${PriceConverter.convertPrice(context, invoice?.tax??0)}',
                        style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                    ],),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                  ],),

                  Divider(),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text("total".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                    Text(PriceConverter.convertPrice(context, (invoice?.grandTotal??0)),
                        style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                  ],),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  Text('${"invoice".tr} # ${invoice?.orderNumber}', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

                  Text('"""${"thank_you".tr}"""', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),

                  Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge),
                    child: CustomDivider(color: Theme.of(context).hintColor),
                  ),
                ],),
              )
            ]),
          );
        }
    );
  }
}