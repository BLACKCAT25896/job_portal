import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/add_new_recruitment_widget.dart';

class CreateNewRecruitmentScreen extends StatefulWidget {
  final RecruitmentItem? recruitmentItem;
  const CreateNewRecruitmentScreen({super.key, this.recruitmentItem});

  @override
  State<CreateNewRecruitmentScreen> createState() => _CreateNewRecruitmentScreenState();
}

class _CreateNewRecruitmentScreenState extends State<CreateNewRecruitmentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "recruitment".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(
          children: [
            SectionHeaderWithPath(sectionTitle: "human_resource".tr, pathItems: ["recruitment"]),
            AddNewRecruitmentWidget(),
          ],
        ))
      ]),
    );
  }
}
