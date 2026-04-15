import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewLoyaltyPointScreen extends StatefulWidget {

  const CreateNewLoyaltyPointScreen({super.key});

  @override
  State<CreateNewLoyaltyPointScreen> createState() => _CreateNewLoyaltyPointScreenState();
}

class _CreateNewLoyaltyPointScreenState extends State<CreateNewLoyaltyPointScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_loyalty_point".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: SizedBox(),
        ),)
      ],),
    );
  }
}
