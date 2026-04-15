
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/skill/controller/skill_controller.dart';
import 'package:mighty_job/feature/skill/presentation/screens/create_new_skill_screen.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/skill_list_widget.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "skill".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<SkillController>().getSkillList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: SkillListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_skill",
              onTap: () =>  Get.to(()=> const CreateNewSkillScreen())),
    );
  }
}



