
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/presentation/widgets/create_new_loyalty_point_widget.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/presentation/widgets/loyalty_point_list_widget.dart';

class LoyaltyPointScreen extends StatefulWidget {
  const LoyaltyPointScreen({super.key});

  @override
  State<LoyaltyPointScreen> createState() => _LoyaltyPointScreenState();
}

class _LoyaltyPointScreenState extends State<LoyaltyPointScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "loyalty_point".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: LoyaltyPointListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(onTap: ()=> Get.to(()=> const CreateNewLoyaltyPointWidget()))
    );
  }
}



