
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/screens/create_new_purchase_screen.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/purchase_list_widget.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "purchase".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: PurchaseListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewPurchaseScreen()))
    );
  }
}



