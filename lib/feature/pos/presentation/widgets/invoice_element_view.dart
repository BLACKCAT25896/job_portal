import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';


class InvoiceElementView extends StatelessWidget {
  final bool isBold;
  final String? title;
  final String? serial;
  final String? quantity;
  final String? price;
  const InvoiceElementView({
    super.key,
    this.serial,
    this.isBold = false,
    this.title,
    this.quantity,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Expanded(flex: 5,
        child: serial != null ? Row(mainAxisAlignment: MainAxisAlignment.start,children: [
          _textView(context, serial!, isBold),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          _textView(context, title!, isBold),

        ],) : Text(title!, style: isBold ? textSemiBold.copyWith(
          fontSize: Dimensions.fontSizeLarge,
        ) : textSemiBold.copyWith(color: Theme.of(context).hintColor)),
      ),

      Expanded(flex: 4,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          quantity != null ? _textView(context, quantity!, isBold) : const SizedBox(),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Text(price!, style: isBold ? textSemiBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
          ) : textSemiBold.copyWith(color: Theme.of(context).hintColor)),
        ],),
      ),
    ],);
  }

  Text _textView(BuildContext context,String text, bool isBold) {
    return Text(text, style: isBold ? textSemiBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
          ) : textSemiBold.copyWith(color: Theme.of(context).hintColor));
  }
}
