import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/account_management/fund/presentation/widgets/create_new_fund_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewFundScreen extends StatefulWidget {

  const CreateNewFundScreen({super.key});

  @override
  State<CreateNewFundScreen> createState() => _CreateNewFundScreenState();
}

class _CreateNewFundScreenState extends State<CreateNewFundScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_fund".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewFundWidget(),
        ),)
      ],),
    );
  }
}
