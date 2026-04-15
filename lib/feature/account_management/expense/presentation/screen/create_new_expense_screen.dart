

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:mighty_job/feature/account_management/expense/presentation/widgets/create_new_expense_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewExpenseScreen extends StatefulWidget {
  final ExpenseItem? expenseItem;
  const CreateNewExpenseScreen({super.key, this.expenseItem});

  @override
  State<CreateNewExpenseScreen> createState() => _CreateNewExpenseScreenState();
}

class _CreateNewExpenseScreenState extends State<CreateNewExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "money_out".tr,),

      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewExpenseWidget()))
      ],),


    );
  }
}
