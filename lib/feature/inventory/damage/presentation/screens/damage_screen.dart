
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/inventory/damage/controller/damage_controller.dart';
import 'package:ecommerce/feature/inventory/damage/presentation/widgets/damage_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DamageScreen extends StatefulWidget {
  const DamageScreen({super.key});

  @override
  State<DamageScreen> createState() => _DamageScreenState();
}

class _DamageScreenState extends State<DamageScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<DamageController>().getDamageList(1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "damage".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: DamageListWidget(scrollController: scrollController))
      ],),
    );
  }
}



