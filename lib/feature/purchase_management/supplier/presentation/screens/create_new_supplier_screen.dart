import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/create_new_supplier_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewSupplierScreen extends StatefulWidget {

  const CreateNewSupplierScreen({super.key});

  @override
  State<CreateNewSupplierScreen> createState() => _CreateNewSupplierScreenState();
}

class _CreateNewSupplierScreenState extends State<CreateNewSupplierScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_supplier".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewSupplierWidget(),
        ),)
      ],),
    );
  }
}
