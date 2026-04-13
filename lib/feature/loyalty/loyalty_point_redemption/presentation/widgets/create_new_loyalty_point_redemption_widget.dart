
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_model.dart';


class CreateNewLoyaltyPointRedemptionWidget extends StatefulWidget {
  final LoyaltyPointRedemptionItem? loyaltyPointRedemptionItem;
  const CreateNewLoyaltyPointRedemptionWidget({super.key, this.loyaltyPointRedemptionItem, });

  @override
  State<CreateNewLoyaltyPointRedemptionWidget> createState() => _CreateNewLoyaltyPointRedemptionWidgetState();
}

class _CreateNewLoyaltyPointRedemptionWidgetState extends State<CreateNewLoyaltyPointRedemptionWidget> {
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
