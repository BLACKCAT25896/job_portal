import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/cms_management/why_choose/domain/model/why_choose_model.dart';
import 'package:mighty_job/feature/cms_management/why_choose/presentation/widgets/create_new_why_choose_us_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewWhyChooseUsScreen extends StatefulWidget {
  final WhyChooseItem? conceptualVideoItem;
  const CreateNewWhyChooseUsScreen({super.key, this.conceptualVideoItem});

  @override
  State<CreateNewWhyChooseUsScreen> createState() => _CreateNewWhyChooseUsScreenState();
}

class _CreateNewWhyChooseUsScreenState extends State<CreateNewWhyChooseUsScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "why_choose_us".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [

        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewWhyChooseUsWidget(whyChooseUsItem: widget.conceptualVideoItem),
          ),
        ),)
      ],),
    );
  }
}
