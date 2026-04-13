import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/account_management/expense/logic/expense_controller.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/screen/create_new_expense_screen.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/widgets/expense_list_widget.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "expense".tr),

      body: RefreshIndicator(onRefresh: () async => Get.find<ExpenseController>().getExpanseList(1),
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: ExpenseListWidget(scrollController: scrollController),)
        ],)),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_expense",
              onTap: ()=> Get.to(()=> const CreateNewExpenseScreen())),
    );
  }
}
