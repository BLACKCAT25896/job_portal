
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:mighty_job/feature/salary_period/presentation/screens/create_new_salary_period_screen.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/salary_period_list_widget.dart';

class SalaryPeriodScreen extends StatefulWidget {
  const SalaryPeriodScreen({super.key});

  @override
  State<SalaryPeriodScreen> createState() => _SalaryPeriodScreenState();
}

class _SalaryPeriodScreenState extends State<SalaryPeriodScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_period".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<SalaryPeriodController>().getSalaryPeriodList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: SalaryPeriodListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_salary_period",
              onTap: () =>  Get.to(()=> const CreateNewSalaryPeriodScreen())),
    );
  }
}



