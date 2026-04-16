
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/add_new_reported_job_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewReportedJobScreen extends StatefulWidget {
  final ReportedJobItem? reportedJobItem;
  const CreateNewReportedJobScreen({super.key, this.reportedJobItem});

  @override
  State<CreateNewReportedJobScreen> createState() => _CreateNewReportedJobScreenState();
}

class _CreateNewReportedJobScreenState extends State<CreateNewReportedJobScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "reported_job".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "reported_job".tr,
              pathItems: ["add_new_reported_job".tr]),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewReportedJobWidget(reportedJobItem: widget.reportedJobItem),
            ),
          ],
        ))
      ],),
    );
  }
}
