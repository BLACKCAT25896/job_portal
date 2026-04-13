import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/model/invoice_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceProductInfoListWidget extends StatelessWidget {
  final Invoice? invoice;
  const InvoiceProductInfoListWidget(this.invoice, {super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OrderController>(builder: (posController) {
        return ListView.builder(
          itemBuilder: (con, index){
            Items? sale = invoice?.items?[index];
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(flex: 5,
                    child:  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("${sale?.product?.name}", maxLines: 2,overflow: TextOverflow.ellipsis,),
                          Text("-${sale?.variant?.name??''}", maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ))

                    ],)
                ),
                const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                Expanded(flex: 3,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${sale?.quantity??''}", style: textRegular,),
                      const SizedBox(width: Dimensions.paddingSizeDefault),

                      Text(PriceConverter.convertPrice(context, sale?.price??0)),
                    ],),
                ),
              ],),
            ],
            );
          },
          itemCount: invoice?.items?.length??0,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        );
      }
    );
  }
}
