

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/create_new_expense_category_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewExpenseCategoryScreen extends StatefulWidget {
  final ExpenseCategoryItem? depositCategoryItem;
  const CreateNewExpenseCategoryScreen({super.key, this.depositCategoryItem});

  @override
  State<CreateNewExpenseCategoryScreen> createState() => _CreateNewExpenseCategoryScreenState();
}

class _CreateNewExpenseCategoryScreenState extends State<CreateNewExpenseCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.depositCategoryItem != null? "update_category".tr : "create_new_expense_category".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewExpenseCategoryWidget(depositCategoryItem: widget.depositCategoryItem),
        ),)
      ],),
    );
  }
}
