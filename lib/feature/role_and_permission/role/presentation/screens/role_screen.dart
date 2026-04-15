
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/screens/create_new_role_screen.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/widgets/role_list_widget.dart';

class RoleManagementScreen extends StatefulWidget {
  const RoleManagementScreen({super.key});

  @override
  State<RoleManagementScreen> createState() => _RoleManagementScreenState();
}

class _RoleManagementScreenState extends State<RoleManagementScreen> {
  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "role".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: RoleListWidget(scrollController: scrollController,))
      ],),


      floatingActionButton: CustomFloatingButton(onTap:()=> Get.to(()=> const CreateNewRoleScreen()))
    );
  }
}



