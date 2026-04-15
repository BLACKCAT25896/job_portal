import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/cms_management/why_choose/presentation/widgets/why_choose_us_list_widget.dart';
import 'package:mighty_job/feature/cms_management/why_choose/presentation/widgets/create_new_why_choose_us_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class WhyChooseUsScreen extends StatefulWidget {
  const WhyChooseUsScreen({super.key});

  @override
  State<WhyChooseUsScreen> createState() => _WhyChooseUsScreenState();
}

class _WhyChooseUsScreenState extends State<WhyChooseUsScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: CustomAppBar(title: "why_choose_us".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: WhyChooseUsListWidget(scrollController: scrollController),)
      ],),

      floatingActionButton: CustomFloatingButton(onTap: (){
        Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: CreateNewWhyChooseUsWidget())));
      },),

    );
  }
}
