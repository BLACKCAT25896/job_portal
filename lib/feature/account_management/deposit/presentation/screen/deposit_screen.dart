import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:mighty_job/feature/account_management/deposit/presentation/screen/create_new_deposit.dart';
import 'package:mighty_job/feature/account_management/deposit/presentation/widgets/deposit_list_widget.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  SearchController searchController = SearchController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "deposit_list".tr),

      body: RefreshIndicator(onRefresh: () async =>
      await Get.find<DepositController>().getDepositList(1),
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: DepositListWidget(scrollController: scrollController),)
        ],)),

      bottomNavigationBar:
          CustomBottomNavigationButton(title: "create_new_deposit",
            onTap: ()=> Get.to(()=> const CreateNewDepositScreen())),
    );
  }
}
