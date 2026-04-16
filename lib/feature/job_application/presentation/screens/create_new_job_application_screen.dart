
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_model.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/add_new_job_application_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewJobApplicationScreen extends StatefulWidget {
  final JobApplicationItem? applicationItem;
  const CreateNewJobApplicationScreen({super.key, this.applicationItem});

  @override
  State<CreateNewJobApplicationScreen> createState() => _CreateNewJobApplicationScreenState();
}

class _CreateNewJobApplicationScreenState extends State<CreateNewJobApplicationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_application".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_application".tr,
              pathItems: ["add_new_application".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewJobApplicationWidget(applicationItem: widget.applicationItem),
            ),
          ],
        ))
      ],),
    );
  }
}
