
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/role_and_permission/user/presentation/screens/create_new_user_screen.dart';
import 'package:job/feature/role_and_permission/user/presentation/widgets/user_list_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "user".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: UserListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewUserScreen())));
  }
}



class CompanyUserScreen extends StatefulWidget {
  const CompanyUserScreen({super.key});

  @override
  State<CompanyUserScreen> createState() => _CompanyUserScreenState();
}

class _CompanyUserScreenState extends State<CompanyUserScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "user".tr),
        body: BaseLayout(scrollController: scrollController,
          child: UserListWidget(scrollController: scrollController),),


        floatingActionButton: CustomFloatingButton(title: "add",
            onTap: ()=> Get.dialog(const CreateNewUserScreen())));
  }
}



