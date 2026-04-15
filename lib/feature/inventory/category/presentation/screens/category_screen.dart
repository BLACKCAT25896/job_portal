
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/inventory/category/controller/category_controller.dart';
import 'package:mighty_job/feature/inventory/category/presentation/screens/create_new_category_screen.dart';
import 'package:mighty_job/feature/inventory/category/presentation/widgets/category_list_widget.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "category".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<CategoryController>().getCategoryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: CategoryListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar : (Get.find<ProfileController>().hasPermission("category-create"))?
          CustomBottomNavigationButton(title: "add_new_category",
              onTap: () =>  Get.to(()=> const CreateNewCategoryScreen()))
      : const SizedBox(),
    );
  }
}



