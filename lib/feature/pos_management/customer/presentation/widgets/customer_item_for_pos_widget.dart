import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/util/dimensions.dart';


class CustomerItemForPosWidget extends StatelessWidget {
  final CustomerItem? customerItem;
  final int index;
  const CustomerItemForPosWidget({super.key, this.customerItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:customerItem?.name??'N/A')),
      Expanded(child: CustomTextItemWidget(text:customerItem?.phone??'N/A')),
      Expanded(child: CustomTextItemWidget(text:customerItem?.address??'N/A')),
      IconButton(onPressed: (){

      }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 16,
        color: Theme.of(context).hintColor,))
      ]);
  }
}