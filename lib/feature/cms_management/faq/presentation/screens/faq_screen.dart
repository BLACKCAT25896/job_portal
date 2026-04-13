import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/cms_management/faq/presentation/screens/create_new_faq_screen.dart';
import 'package:ecommerce/feature/cms_management/faq/presentation/widgets/faq_list_widget.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(title: "faq".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [

        SliverToBoxAdapter(child: FaqListWidget(scrollController: scrollController),)
      ],),

      floatingActionButton:
      CustomFloatingButton(onTap: (){
        Get.to(()=> const CreateNewFAqScreen());
      }),
    );
  }
}
