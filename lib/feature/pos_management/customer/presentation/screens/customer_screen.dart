
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/create_new_customer_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/customer_list_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "customer".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: CustomerListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(onTap: ()=> Get.to(()=> const CreateNewCustomerWidget()))
    );
  }
}



