
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:mighty_job/feature/inquiry/presentation/screens/create_new_inquiry_screen.dart';
import 'package:mighty_job/feature/inquiry/presentation/widgets/inquiry_list_widget.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "inquiry".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<InquiryController>().getInquiryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: InquiryListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_inquiry",
              onTap: () =>  Get.to(()=> const CreateNewInquiryScreen())),
    );
  }
}



