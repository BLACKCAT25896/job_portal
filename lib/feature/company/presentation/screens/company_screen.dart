
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/company/controller/company_controller.dart';
import 'package:mighty_job/feature/company/presentation/screens/create_new_company_screen.dart';
import 'package:mighty_job/feature/company/presentation/widgets/company_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "company".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<CompanyController>().getCompanyList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: CompanyListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_company",
              onTap: () =>  Get.to(()=> const CreateNewCompanyScreen())),
    );
  }
}



