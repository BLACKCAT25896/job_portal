
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_model.dart';
import 'package:mighty_job/feature/job_stage/presentation/widgets/add_new_job_stage_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewJobStageScreen extends StatefulWidget {
  final JobStageItem? stageItem;
  const CreateNewJobStageScreen({super.key, this.stageItem});

  @override
  State<CreateNewJobStageScreen> createState() => _CreateNewJobStageScreenState();
}

class _CreateNewJobStageScreenState extends State<CreateNewJobStageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_stage".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_stage".tr,
              pathItems: ["add_new_stage".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewJobStageWidget(stageItem: widget.stageItem),
            ),
          ],
        ))
      ],),
    );
  }
}
