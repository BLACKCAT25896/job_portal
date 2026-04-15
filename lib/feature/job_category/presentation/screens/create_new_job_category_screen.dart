
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/feature/job_category/presentation/widgets/add_new_job_category_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewJobCategoryScreen extends StatefulWidget {
  final JobCategoryItem? categoryItem;
  const CreateNewJobCategoryScreen({super.key, this.categoryItem});

  @override
  State<CreateNewJobCategoryScreen> createState() => _CreateNewJobCategoryScreenState();
}

class _CreateNewJobCategoryScreenState extends State<CreateNewJobCategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_category".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_category".tr,
              pathItems: ["add_new_category".tr]),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewJobCategoryWidget(categoryItem: widget.categoryItem),
            ),
          ],
        ))
      ],),
    );
  }
}
