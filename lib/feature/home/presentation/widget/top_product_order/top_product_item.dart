import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class TopProductItemWidget extends StatelessWidget {
  final TopProducts? productItem;
  final int index;
  const TopProductItemWidget({super.key, this.productItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${productItem?.name}")),
      Expanded(child: CustomTextItemWidget(text:productItem?.totalSold??"N/A")),
    ]):

    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          NumberingWidget(index: index),
          Expanded(child: CustomTextItemWidget(text:"${productItem?.totalSold??0}")),
        ]),

        CustomTextItemWidget(text: "${"customer".tr} ${productItem?.name??"N/A"}"),
      ]),
    );
  }
}