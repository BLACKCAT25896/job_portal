import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/create_new_purchase_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewPurchaseScreen extends StatefulWidget {
  final PurchaseItem? purchaseItem;
  const CreateNewPurchaseScreen({super.key, this.purchaseItem});

  @override
  State<CreateNewPurchaseScreen> createState() => _CreateNewPurchaseScreenState();
}

class _CreateNewPurchaseScreenState extends State<CreateNewPurchaseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_purchase".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewPurchaseWidget(purchaseItem: widget.purchaseItem),
        ),)
      ],),
    );
  }
}
