
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/screens/create_new_unit_screen.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/widgets/unit_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';

class UnitScreen extends StatefulWidget {
  const UnitScreen({super.key});

  @override
  State<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "unit".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: UnitListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewUnitScreen()))
    );
  }
}



