import 'package:ecommerce/feature/order_management/order_type/domain/model/order_type_model.dart';
import 'package:ecommerce/feature/order_management/order_type/presentation/widgets/create_new_order_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewOrderTypeScreen extends StatefulWidget {
  final OrderTypeItem? orderTypeItem;
  const CreateNewOrderTypeScreen({super.key, this.orderTypeItem});

  @override
  State<CreateNewOrderTypeScreen> createState() => _CreateNewOrderTypeScreenState();
}

class _CreateNewOrderTypeScreenState extends State<CreateNewOrderTypeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "add_new_order_type".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewOrderTypeWidget(orderTypeItem: widget.orderTypeItem),
        ),)
      ],),
    );
  }
}
