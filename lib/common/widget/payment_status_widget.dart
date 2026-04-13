import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/styles.dart';

class PaymentStatusWidget extends StatelessWidget {
  final String? status;
  const PaymentStatusWidget({super.key,  this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${"payment_status".tr} : ", style: textRegular.copyWith(),),
        Text(status?.capitalize??'', style: textRegular.copyWith(
            color: status == "paid"? Colors.green : status == "partial"? Colors.orangeAccent : Colors.red
        ),),
      ],
    );
  }
}
