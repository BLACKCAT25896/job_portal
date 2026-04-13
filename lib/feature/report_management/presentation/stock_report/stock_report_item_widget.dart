import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/stock_report_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:get/get.dart';


class StockReportItemWidget extends StatelessWidget {
  final StockReportItem? stockReportItem;
  final int index;
  const StockReportItemWidget({super.key, this.stockReportItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.productName}")),
        Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.quantity}")),
        Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.previousQty}")),
        Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.newQty}")),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, stockReportItem?.unitCost??0))),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, stockReportItem?.totalCost??0))),
      ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.productName}")),
          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:"${"qty".tr}: ${stockReportItem?.quantity}")),
            Expanded(child: CustomTextItemWidget(text:"${"previous_qty".tr}: ${stockReportItem?.previousQty}")),
            Expanded(child: CustomTextItemWidget(text:"${"new_qty".tr}: ${stockReportItem?.newQty}")),
            Expanded(child: CustomTextItemWidget(text: "${"unit_price".tr}: ${PriceConverter.convertPrice(context, stockReportItem?.unitCost??0)}")),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text: "${"total".tr}: ${PriceConverter.convertPrice(context, stockReportItem?.totalCost??0)}")),
          ]),
        ],
      ),
    );
  }
}