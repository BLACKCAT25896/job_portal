import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/account_list_widget.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/account_mobile_bottom_section.dart';
import 'package:ecommerce/helper/responsive_helper.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController searchController =  TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "account".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: GetBuilder<AccountController>(
            builder: (accountController) {
              return AccountListWidget(scrollController: scrollController);
            }))
      ],),
      bottomNavigationBar: (!ResponsiveHelper.isDesktop(context))?
      AccountMobileBottomSection() : SizedBox(),

    );
  }
}
