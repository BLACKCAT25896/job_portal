import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/create_new_explore_widget.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/explore_list_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: CustomAppBar(title: "explore".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [

        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: ExploreListWidget(scrollController: scrollController),
          ),
        ),)
      ],),
      floatingActionButton:
      CustomFloatingButton(onTap: (){
        Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(width: ResponsiveHelper.isDesktop(context)? 600 : Get.width,
              child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: CreateNewExploreWidget(),
              ),
            )));
      }),
    );
  }
}
