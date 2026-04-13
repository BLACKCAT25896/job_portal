import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/purchase_report_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:get/get.dart';

class PurchaseReportItemWidget extends StatelessWidget {
  final PurchaseReportItem? purchaseItem;
  final int index;
  const PurchaseReportItemWidget({super.key, this.purchaseItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: purchaseItem?.purchaseDate??'N/A')),
      Expanded(child: CustomTextItemWidget(text: purchaseItem?.invoiceNo??'N/A')),
      Expanded(child: CustomTextItemWidget(text: purchaseItem?.supplier?.name??'N/A')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, purchaseItem?.totalAmount??0))),
    ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text: purchaseItem?.purchaseDate??'N/A')),
          ]),
          CustomTextItemWidget(text: "${"supplier".tr}: ${purchaseItem?.supplier?.name??'N/A'}"),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text: purchaseItem?.invoiceNo??'N/A')),
            Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, purchaseItem?.totalAmount??0))),
          ]),
        ],
      ),
    );
  }
}
