import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/opening_stock_report_model.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:get/get.dart';


class OpeningStockReportItemWidget extends StatelessWidget {
  final OpeningStockReportItem? stockReportItem;
  final int index;
  const OpeningStockReportItemWidget({super.key, this.stockReportItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.productName}")),
        Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.openingStock}")),
      Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.currentStock}")),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, stockReportItem?.unitCost??0))),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, stockReportItem?.marketValue??0))),

      ]):
    CustomContainer(showShadow: false, borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeSmall,
          children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${stockReportItem?.productName}")),
            ]),
            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextItemWidget(text:"${"opening_stock".tr}: ${stockReportItem?.openingStock}")),
              Expanded(child: CustomTextItemWidget(text:"${"current_stock".tr}: ${stockReportItem?.currentStock}")),
            ]),

            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextItemWidget(text: "${"unit_price".tr}: ${PriceConverter.convertPrice(context, stockReportItem?.unitCost??0)}")),
              Expanded(child: CustomTextItemWidget(text: "${"market_value".tr} ${PriceConverter.convertPrice(context, stockReportItem?.marketValue??0)}")),
            ]),
          ],
        ),
      );
  }
}