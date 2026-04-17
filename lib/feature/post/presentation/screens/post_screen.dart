
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/post/controller/post_controller.dart';
import 'package:mighty_job/feature/post/presentation/screens/create_new_post_screen.dart';
import 'package:mighty_job/feature/post/presentation/widgets/post_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "post".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<PostController>().getPostList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: PostListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_post",
              onTap: () =>  Get.to(()=> const CreateNewPostScreen())),
    );
  }
}



