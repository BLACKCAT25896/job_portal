import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/transaction/domain/models/transaction_model.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem? transactionItem;
  final int index;
  const TransactionItemWidget({super.key,  required this.index, this.transactionItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: transactionItem?.invoiceId??'')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, transactionItem?.amount??0))),

    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

            const SizedBox(width: Dimensions.paddingSizeSmall),
            Expanded(child: Text("${transactionItem?.invoiceId}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),

            ],
          )),
    );
    }
  }