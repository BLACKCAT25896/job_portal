
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/post_comment/controller/post_comment_controller.dart';
import 'package:mighty_job/feature/post_comment/presentation/screens/create_new_post_comment_screen.dart';
import 'package:mighty_job/feature/post_comment/presentation/widgets/post_comment_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCommentScreen extends StatefulWidget {
  const PostCommentScreen({super.key});

  @override
  State<PostCommentScreen> createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "post_comment".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<PostCommentController>().getPostCommentList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: PostCommentListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_post_comment",
              onTap: () =>  Get.to(()=> const CreateNewPostCommentScreen())),
    );
  }
}



