
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_model.dart';


class CreateNewPurchaseReturnWidget extends StatefulWidget {
  final PurchaseReturnItem? purchaseReturnItem;
  const CreateNewPurchaseReturnWidget({super.key, this.purchaseReturnItem, });

  @override
  State<CreateNewPurchaseReturnWidget> createState() => _CreateNewPurchaseReturnWidgetState();
}

class _CreateNewPurchaseReturnWidgetState extends State<CreateNewPurchaseReturnWidget> {
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
