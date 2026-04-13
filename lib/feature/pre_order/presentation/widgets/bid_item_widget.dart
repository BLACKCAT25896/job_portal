import 'package:ecommerce/common/widget/custom_item_text_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class BidItemWidget extends StatelessWidget {
  final Bids? bid;
  final int index;
  const BidItemWidget({super.key, this.bid, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text: "${bid?.user?.firstName??'N/A'} ${bid?.user?.lastName??''}",)),
      Expanded(child: CustomItemTextWidget(
        text: PriceConverter.convertPrice(context, bid?.bidAmount??0)))


    ]):
    CustomContainer(borderRadius: 5, showShadow: false,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [
        (CustomItemTextWidget(text: "${bid?.user?.firstName??'N/A'} ${bid?.user?.lastName??''}",)),
        (CustomItemTextWidget(
            text: PriceConverter.convertPrice(context, bid?.bidAmount??0)))

        ],
      ),
    );
  }
}