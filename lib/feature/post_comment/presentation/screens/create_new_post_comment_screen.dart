
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_model.dart';
import 'package:mighty_job/feature/post_comment/presentation/widgets/add_new_post_comment_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPostCommentScreen extends StatefulWidget {
  final PostCommentItem? postCommentItem;
  const CreateNewPostCommentScreen({super.key, this.postCommentItem});

  @override
  State<CreateNewPostCommentScreen> createState() => _CreateNewPostCommentScreenState();
}

class _CreateNewPostCommentScreenState extends State<CreateNewPostCommentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_post_comment".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_post_comment".tr,
              pathItems: ["add_new_post_comment".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewPostCommentWidget(postCommentItem: widget.postCommentItem),
            ),
          ],
        ))
      ],),
    );
  }
}
