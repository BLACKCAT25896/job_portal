
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/post_category/controller/post_category_controller.dart';
import 'package:mighty_job/feature/post_category/presentation/screens/create_new_post_category_screen.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/post_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PostCategoryScreen extends StatefulWidget {
  const PostCategoryScreen({super.key});

  @override
  State<PostCategoryScreen> createState() => _PostCategoryScreenState();
}

class _PostCategoryScreenState extends State<PostCategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "post_category".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<PostCategoryController>().getPostCategoryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: PostCategoryListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_post_category",
              onTap: () =>  Get.to(()=> const CreateNewPostCategoryScreen())),
    );
  }
}



