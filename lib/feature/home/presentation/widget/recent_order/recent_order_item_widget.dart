import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class RecentOrderItemWidget extends StatelessWidget {
  final LatestOrders? orderItem;
  final int index;
  const RecentOrderItemWidget({super.key, this.orderItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderNumber}")),
      Expanded(child: CustomTextItemWidget(text:orderItem?.customer?.name??"N/A")),

      Expanded(child: CustomTextItemWidget(text:DateConverter.quotationDateAndTime(DateTime.parse(orderItem?.orderDate??'')))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, orderItem?.grandTotal??0))),


    ]):CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderNumber}")),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text: "${"customer".tr} ${orderItem?.customer?.name??"N/A"}")),

          ]),

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:DateConverter.quotationDateAndTime(DateTime.parse(orderItem?.orderDate??'')))),
            Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, orderItem?.grandTotal??0))),


          ]),
        ],
      ),
    );
  }
}