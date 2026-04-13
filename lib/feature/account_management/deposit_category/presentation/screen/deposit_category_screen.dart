import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/screen/create_new_deposit_category_screen.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/deposit_category_list_widget.dart';


class DepositCategoryScreen extends StatefulWidget {
  const DepositCategoryScreen({super.key});

  @override
  State<DepositCategoryScreen> createState() => _DepositCategoryScreenState();
}

class _DepositCategoryScreenState extends State<DepositCategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "deposit_category".tr),

      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<DepositCategoryController>().getDepositCategoryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: DepositCategoryListWidget(scrollController: scrollController),)
        ],),
      ),
      bottomNavigationBar : CustomBottomNavigationButton(title: "new_category",
          onTap: ()=> Get.to(()=> const CreateNewDepositCategoryScreen())),
    );
  }
}
