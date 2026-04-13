import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/human_resource/interview/presentation/widgets/add_new_interview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/human_resource/interview/domain/models/interview_model.dart';

class CreateNewInterviewScreen extends StatefulWidget {
  final InterviewItem? interviewItem;
  const CreateNewInterviewScreen({super.key, this.interviewItem});

  @override
  State<CreateNewInterviewScreen> createState() => _CreateNewInterviewScreenState();
}

class _CreateNewInterviewScreenState extends State<CreateNewInterviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "interview".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewInterviewWidget(interviewItem: widget.interviewItem),)]));
  }
}
