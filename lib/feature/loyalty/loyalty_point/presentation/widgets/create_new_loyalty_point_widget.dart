
import 'package:flutter/material.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/domain/model/loyalty_point_model.dart';


class CreateNewLoyaltyPointWidget extends StatefulWidget {
  final LoyaltyPointItem? loyaltyPointItem;
  const CreateNewLoyaltyPointWidget({super.key, this.loyaltyPointItem, });

  @override
  State<CreateNewLoyaltyPointWidget> createState() => _CreateNewLoyaltyPointWidgetState();
}

class _CreateNewLoyaltyPointWidgetState extends State<CreateNewLoyaltyPointWidget> {
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
