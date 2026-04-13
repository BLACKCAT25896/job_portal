import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/tax_management/tax/presentation/widgets/create_new_tax_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewTaxScreen extends StatefulWidget {

  const CreateNewTaxScreen({super.key});

  @override
  State<CreateNewTaxScreen> createState() => _CreateNewTaxScreenState();
}

class _CreateNewTaxScreenState extends State<CreateNewTaxScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_tax".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewTaxWidget(),
        ),)
      ],),
    );
  }
}
