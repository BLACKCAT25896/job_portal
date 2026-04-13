
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/screen/create_new_account.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/account_list_widget.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';

class AccountListScreen extends StatefulWidget {
  const AccountListScreen({super.key});

  @override
  State<AccountListScreen> createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "transaction_accounts".tr,),


      body: RefreshIndicator(
        onRefresh: () async{
          await Get.find<AccountController>().getAccountList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: AccountListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar: (Get.find<ProfileController>().hasPermission("account-create"))?
          CustomBottomNavigationButton(title: "create_new_account", onTap: ()=> Get.to(() => const CreateNewAccount()))
       : const SizedBox(),
    );
  }
}

