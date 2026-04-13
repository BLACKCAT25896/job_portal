
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_model.dart';


class CreateNewOrderWidget extends StatefulWidget {
  final OrderItem? orderItem;
  const CreateNewOrderWidget({super.key, this.orderItem, });

  @override
  State<CreateNewOrderWidget> createState() => _CreateNewOrderWidgetState();
}

class _CreateNewOrderWidgetState extends State<CreateNewOrderWidget> {
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
