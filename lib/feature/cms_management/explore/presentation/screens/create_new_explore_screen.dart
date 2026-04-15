import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/create_new_explore_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewBenefitScreen extends StatefulWidget {
  const CreateNewBenefitScreen({super.key});

  @override
  State<CreateNewBenefitScreen> createState() => _CreateNewBenefitScreenState();
}

class _CreateNewBenefitScreenState extends State<CreateNewBenefitScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "explore".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewExploreWidget(),
          ),
        ),)
      ],),
    );
  }
}
