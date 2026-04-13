import 'package:ecommerce/feature/order_management/order_status/domain/model/order_status_model.dart';
import 'package:ecommerce/feature/order_management/order_status/presentation/widgets/create_new_order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewOrderStatusScreen extends StatefulWidget {
  final OrderStatusItem? orderStatusItem;
  const CreateNewOrderStatusScreen({super.key, this.orderStatusItem});

  @override
  State<CreateNewOrderStatusScreen> createState() => _CreateNewOrderStatusScreenState();
}

class _CreateNewOrderStatusScreenState extends State<CreateNewOrderStatusScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "add_new_order_status".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewOrderStatusWidget(orderStatusItem: widget.orderStatusItem),
        ),)
      ],),
    );
  }
}
