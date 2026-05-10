
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/section_header_with_path_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/post/domain/models/post_model.dart';
import 'package:job/feature/post/presentation/widgets/add_new_post_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPostScreen extends StatefulWidget {
  final PostItem? postItem;
  const CreateNewPostScreen({super.key, this.postItem});

  @override
  State<CreateNewPostScreen> createState() => _CreateNewPostScreenState();
}

class _CreateNewPostScreenState extends State<CreateNewPostScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_post".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_post".tr,
              pathItems: ["add_new_post".tr]),
            Padding(padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewPostWidget(postItem: widget.postItem),
            ),
          ],
        ))
      ],),
    );
  }
}
