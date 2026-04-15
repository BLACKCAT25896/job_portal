
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/companySize/controller/company_size_controller.dart';
import 'package:mighty_job/feature/companySize/presentation/screens/create_new_company_size_screen.dart';
import 'package:mighty_job/feature/companySize/presentation/widgets/company_size_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySizeScreen extends StatefulWidget {
  const CompanySizeScreen({super.key});

  @override
  State<CompanySizeScreen> createState() => _CompanySizeScreenState();
}

class _CompanySizeScreenState extends State<CompanySizeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "company_size".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<CompanySizeController>().getCompanySizeList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: CompanySizeListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_company_size",
              onTap: () =>  Get.to(()=> const CreateNewCompanySizeScreen())),
    );
  }
}



