import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/web_app_bar.dart';
import 'package:ecommerce/feature/cms_management/feedback/domain/model/feedback_model.dart';
import 'package:ecommerce/feature/cms_management/feedback/presentation/widgets/create_new_feedback_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewFeedbackScreen extends StatefulWidget {
  final FeedbackItem? feedbackItem;
  const CreateNewFeedbackScreen({super.key, this.feedbackItem});

  @override
  State<CreateNewFeedbackScreen> createState() => _CreateNewFeedbackScreenState();
}

class _CreateNewFeedbackScreenState extends State<CreateNewFeedbackScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context)? null : CustomAppBar(title: "feedback".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        if(ResponsiveHelper.isDesktop(context))
          SliverAppBar(automaticallyImplyLeading: false, title: WebAppBar(), titleSpacing: 0, pinned: true, toolbarHeight: 60, elevation: 5,),
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewFeedbackWidget(feedbackItem: widget.feedbackItem),
          ),
        ),)
      ],),
    );
  }
}
