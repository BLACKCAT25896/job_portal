import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/cms_management/feedback/presentation/widgets/create_new_feedback_widget.dart';
import 'package:mighty_job/feature/cms_management/feedback/presentation/widgets/feedback_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "feedback".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [

        SliverToBoxAdapter(child: FeedbackListWidget(scrollController: scrollController),)
      ],),
      floatingActionButton: CustomFloatingButton(onTap: (){
            Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: CreateNewFeedbackWidget(),
                )));
          },)

    );
  }
}
