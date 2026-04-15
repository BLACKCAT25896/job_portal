
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/industries/controller/industry_controller.dart';
import 'package:ecommerce/feature/industries/presentation/screens/create_new_industry_screen.dart';
import 'package:ecommerce/feature/industries/presentation/widgets/industry_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndustryScreen extends StatefulWidget {
  const IndustryScreen({super.key});

  @override
  State<IndustryScreen> createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "industry".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<IndustryController>().getIndustryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: IndustryListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_industry",
              onTap: () =>  Get.to(()=> const CreateNewIndustryScreen())),
    );
  }
}



