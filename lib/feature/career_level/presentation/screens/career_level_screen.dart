
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/career_level/controller/career_level_controller.dart';
import 'package:ecommerce/feature/career_level/presentation/screens/create_new_career_level_screen.dart';
import 'package:ecommerce/feature/career_level/presentation/widgets/career_level_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerLevelScreen extends StatefulWidget {
  const CareerLevelScreen({super.key});

  @override
  State<CareerLevelScreen> createState() => _CareerLevelScreenState();
}

class _CareerLevelScreenState extends State<CareerLevelScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "career_level".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<CareerLevelController>().getCareerLevelList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: CareerLevelListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_career_level",
              onTap: () =>  Get.to(()=> const CreateNewCareerLevelScreen())),
    );
  }
}



