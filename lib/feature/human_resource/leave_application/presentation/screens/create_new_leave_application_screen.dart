import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/leave_application/presentation/widgets/create_new_leave_application_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/leave_application/domain/models/leave_application_model.dart';

class CreateNewLeaveApplicationScreen extends StatefulWidget {
  final LeaveApplicationItem? leaveApplicationItem;
  const CreateNewLeaveApplicationScreen({super.key, this.leaveApplicationItem});

  @override
  State<CreateNewLeaveApplicationScreen> createState() => _CreateNewLeaveApplicationScreenState();
}

class _CreateNewLeaveApplicationScreenState extends State<CreateNewLeaveApplicationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "leave_application".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: CreateNewLeaveApplicationWidget(leaveApplicationItem: widget.leaveApplicationItem),)]));
  }
}
