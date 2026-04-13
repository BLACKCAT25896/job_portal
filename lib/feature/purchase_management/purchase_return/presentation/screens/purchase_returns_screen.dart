
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/presentation/widgets/create_new_returns_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/presentation/widgets/purchase_returns_list_widget.dart';

class PurchaseReturnScreen extends StatefulWidget {
  const PurchaseReturnScreen({super.key});

  @override
  State<PurchaseReturnScreen> createState() => _PurchaseReturnScreenState();
}

class _PurchaseReturnScreenState extends State<PurchaseReturnScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "purchase_return".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: PurchaseReturnListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(onTap: ()=> Get.to(()=> const CreateNewPurchaseReturnWidget()))
    );
  }
}



