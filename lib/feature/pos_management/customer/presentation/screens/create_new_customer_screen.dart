import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/create_new_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewCustomerScreen extends StatefulWidget {

  const CreateNewCustomerScreen({super.key});

  @override
  State<CreateNewCustomerScreen> createState() => _CreateNewCustomerScreenState();
}

class _CreateNewCustomerScreenState extends State<CreateNewCustomerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_customer".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewCustomerWidget(),
        ),)
      ],),
    );
  }
}
