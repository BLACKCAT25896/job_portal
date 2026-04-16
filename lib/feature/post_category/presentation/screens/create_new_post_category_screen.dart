
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_model.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/add_new_post_category_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPostCategoryScreen extends StatefulWidget {
  final PostCategoryItem? postCategoryItem;
  const CreateNewPostCategoryScreen({super.key, this.postCategoryItem});

  @override
  State<CreateNewPostCategoryScreen> createState() => _CreateNewPostCategoryScreenState();
}

class _CreateNewPostCategoryScreenState extends State<CreateNewPostCategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_post_category".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_post_category".tr,
              pathItems: ["add_new_post_category".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewPostCategoryWidget(postCategoryItem: widget.postCategoryItem),
            ),
          ],
        ))
      ],),
    );
  }
}
