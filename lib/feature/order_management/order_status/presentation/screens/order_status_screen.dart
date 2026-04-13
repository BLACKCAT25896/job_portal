
import 'package:ecommerce/feature/order_management/order_status/presentation/screens/create_new_order_status_screen.dart';
import 'package:ecommerce/feature/order_management/order_status/presentation/widgets/order_status_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "order_status".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: OrderStatusListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewOrderStatusScreen()))
    );
  }
}



