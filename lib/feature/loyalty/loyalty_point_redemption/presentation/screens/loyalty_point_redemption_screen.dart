
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point_redemption/presentation/widgets/create_new_loyalty_point_redemption_widget.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point_redemption/presentation/widgets/loyalty_point_redemption_list_widget.dart';

class LoyaltyPointRedemptionScreen extends StatefulWidget {
  const LoyaltyPointRedemptionScreen({super.key});

  @override
  State<LoyaltyPointRedemptionScreen> createState() => _LoyaltyPointRedemptionScreenState();
}

class _LoyaltyPointRedemptionScreenState extends State<LoyaltyPointRedemptionScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "loyalty_point_redemption".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: LoyaltyPointRedemptionListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewLoyaltyPointRedemptionWidget()))
    );
  }
}



