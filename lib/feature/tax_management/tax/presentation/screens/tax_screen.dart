
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/tax_management/tax/presentation/widgets/create_new_tax_widget.dart';
import 'package:ecommerce/feature/tax_management/tax/presentation/widgets/tax_list_widget.dart';

class TaxScreen extends StatefulWidget {
  const TaxScreen({super.key});

  @override
  State<TaxScreen> createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "tax".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: TaxListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(onTap: ()=> Get.to(()=> const CreateNewTaxWidget()))
    );
  }
}



