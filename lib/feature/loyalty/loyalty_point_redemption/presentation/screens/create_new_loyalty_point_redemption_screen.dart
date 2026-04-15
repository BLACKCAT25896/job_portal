import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewLoyaltyPointRedemptionScreen extends StatefulWidget {

  const CreateNewLoyaltyPointRedemptionScreen({super.key});

  @override
  State<CreateNewLoyaltyPointRedemptionScreen> createState() => _CreateNewLoyaltyPointRedemptionScreenState();
}

class _CreateNewLoyaltyPointRedemptionScreenState extends State<CreateNewLoyaltyPointRedemptionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_loyalty_point_redemption".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: SizedBox(),
        ),)
      ],),
    );
  }
}
