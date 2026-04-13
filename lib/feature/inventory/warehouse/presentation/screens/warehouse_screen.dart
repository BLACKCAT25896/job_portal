
import 'package:ecommerce/feature/inventory/warehouse/presentation/screens/create_new_warehouse_screen.dart';
import 'package:ecommerce/feature/inventory/warehouse/presentation/widgets/warehouse_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "warehouse".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: WarehouseListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewWarehouseScreen()))
    );
  }
}



