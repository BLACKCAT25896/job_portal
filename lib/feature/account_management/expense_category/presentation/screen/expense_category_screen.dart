import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/feature/account_management/expense_category/presentation/screen/create_new_expense_category_screen.dart';
import 'package:mighty_job/feature/account_management/expense_category/presentation/widgets/expense_category_list_widget.dart';


class ExpenseCategoryScreen extends StatefulWidget {
  const ExpenseCategoryScreen({super.key});

  @override
  State<ExpenseCategoryScreen> createState() => _ExpenseCategoryScreenState();
}

class _ExpenseCategoryScreenState extends State<ExpenseCategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "expense_category".tr),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<ExpanseCategoryController>().getExpanseCategoryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: ExpenseCategoryListWidget(scrollController: scrollController))
        ])),

      bottomNavigationBar :
      CustomBottomNavigationButton(title: "new_category",
          onTap: ()=> Get.to(()=> const CreateNewExpenseCategoryScreen())),
     
    );
  }
}
