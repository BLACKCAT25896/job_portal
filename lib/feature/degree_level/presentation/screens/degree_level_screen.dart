
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/degree_level/controller/degree_level_controller.dart';
import 'package:ecommerce/feature/degree_level/presentation/screens/create_new_degree_level_screen.dart';
import 'package:ecommerce/feature/degree_level/presentation/widgets/degree_level_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DegreeLevelScreen extends StatefulWidget {
  const DegreeLevelScreen({super.key});

  @override
  State<DegreeLevelScreen> createState() => _DegreeLevelScreenState();
}

class _DegreeLevelScreenState extends State<DegreeLevelScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "degree_level".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<DegreeLevelController>().getDegreeLevelList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: DegreeLevelListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_degree_level",
              onTap: () =>  Get.to(()=> const CreateNewDegreeLevelScreen())),
    );
  }
}



