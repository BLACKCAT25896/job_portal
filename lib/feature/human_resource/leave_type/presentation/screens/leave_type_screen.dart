
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/human_resource/leave_type/presentation/screens/create_new_leave_type_screen.dart';
import 'package:ecommerce/feature/human_resource/leave_type/presentation/widgets/leave_type_list_widget.dart';

class LeaveTypeScreen extends StatefulWidget {
  const LeaveTypeScreen({super.key});

  @override
  State<LeaveTypeScreen> createState() => _LeaveTypeScreenState();
}

class _LeaveTypeScreenState extends State<LeaveTypeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "leave_type".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: LeaveTypeListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewLeaveTypeScreen())));
  }
}



