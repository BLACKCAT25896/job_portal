import 'package:flutter/material.dart';
import 'package:ecommerce/common/layout/heading_menu_widget.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_generic__items_dialog.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:get/get.dart';


class PurchaseItemDialog extends StatelessWidget {
  final List<PurchaseProductItems>? items;
  const PurchaseItemDialog({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GenericListDialog<PurchaseProductItems>(
      title: isDesktop?
      HeadingMenu(showActionOption: false, headings: ["name", "unit_price", "quantity", "discount", "tax", "total", "expiry"]):null,
      items: items,
      itemBuilder: (context, item, index) => CustomContainer(borderRadius: 0,
        child: isDesktop?
        Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
          NumberingWidget(index: index),
          Expanded(child: CustomTextItemWidget(text: item.product?.name??'')),
          Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.unitPrice??0))),
          Expanded(child: CustomTextItemWidget(text: "${item.quantity?? 0}")),
          Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.discountAmount??0))),
          Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.taxAmount??0))),
          Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.totalCost??0))),
          Expanded(child: CustomTextItemWidget(text: item.expiryDate??'N/A')),

          ],
        ):
        CustomContainer(showShadow: false,borderRadius: 5,
          child: Column(spacing: Dimensions.paddingSizeSmall,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
                NumberingWidget(index: index),
                Expanded(child: CustomTextItemWidget(text: item.product?.name??'')),
              ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(child: CustomTextItemWidget(text: "${"unit_price".tr}: ${PriceConverter.convertPrice(context, item.unitPrice??0)}")),
                Expanded(child: CustomTextItemWidget(text: "${"qty".tr}: ${item.quantity??'0'}")),
              ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(child: CustomTextItemWidget(text: "${"discount".tr}: ${PriceConverter.convertPrice(context, item.discountAmount??0)}")),
                Expanded(child: CustomTextItemWidget(text: "${"tax".tr}: ${PriceConverter.convertPrice(context, item.taxAmount??0)}")),
              ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
               Expanded(child: CustomTextItemWidget(text: "${"total".tr}: ${PriceConverter.convertPrice(context, item.totalCost??0)}")),
                Expanded(child: CustomTextItemWidget(text: "${"expiry".tr}: ${item.expiryDate??'N/A'}")),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
