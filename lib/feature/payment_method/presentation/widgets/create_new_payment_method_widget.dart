
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';


class CreateNewPaymentMethodWidget extends StatefulWidget {
  final PaymentMethodItem? item;
  const CreateNewPaymentMethodWidget({super.key, this.item, });

  @override
  State<CreateNewPaymentMethodWidget> createState() => _CreateNewPaymentMethodWidgetState();
}

class _CreateNewPaymentMethodWidgetState extends State<CreateNewPaymentMethodWidget> {
  TextEditingController nameController = TextEditingController();

  bool update = false;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
