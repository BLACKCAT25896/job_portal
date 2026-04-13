import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewPurchaseReturnScreen extends StatefulWidget {

  const CreateNewPurchaseReturnScreen({super.key});

  @override
  State<CreateNewPurchaseReturnScreen> createState() => _CreateNewPurchaseReturnScreenState();
}

class _CreateNewPurchaseReturnScreenState extends State<CreateNewPurchaseReturnScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_purchase_return".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: SizedBox(),
        ),)
      ],),
    );
  }
}
