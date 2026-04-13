import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/create_new_deposit_category_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewDepositCategoryScreen extends StatefulWidget {
  final DepositCategoryItem? depositCategoryItem;
  const CreateNewDepositCategoryScreen({super.key, this.depositCategoryItem});

  @override
  State<CreateNewDepositCategoryScreen> createState() => _CreateNewDepositCategoryScreenState();
}

class _CreateNewDepositCategoryScreenState extends State<CreateNewDepositCategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.depositCategoryItem != null? "update_category".tr : "create_new_deposit_category".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewDepositCategoryWidget(),
        ),)
      ],),
    );
  }
}
