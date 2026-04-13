import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/expense_category_details_widget.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/expense_category_edit_delete_widget.dart';

class ExpenseCategoryDetailsScreen extends StatefulWidget {
  final ExpenseCategoryItem? expenseCategoryItem;
  const ExpenseCategoryDetailsScreen({super.key, this.expenseCategoryItem});

  @override
  State<ExpenseCategoryDetailsScreen> createState() => _ExpenseCategoryDetailsScreenState();
}

class _ExpenseCategoryDetailsScreenState extends State<ExpenseCategoryDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.expenseCategoryItem?.name??'', actions: [
        IconButton(onPressed: (){
          if(widget.expenseCategoryItem?.id != null) {
            Get.bottomSheet(ExpenseCategoryEditDeleteWidget(expenseCategoryItem: widget.expenseCategoryItem));
          }else{
            showCustomSnackBar( "you_cannot_edit_or_delete_message".tr);
          }
        },
            icon: const Icon(Icons.more_vert_outlined, color: Colors.white,))
      ]),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: ExpenseCategoryDetailsWidget(expenseCategoryItem: widget.expenseCategoryItem))
      ],),
    );
  }
}
