
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:mighty_job/feature/salary_currency/presentation/screens/create_new_salary_currency_screen.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/salary_currency_list_widget.dart';

class SalaryCurrencyScreen extends StatefulWidget {
  const SalaryCurrencyScreen({super.key});

  @override
  State<SalaryCurrencyScreen> createState() => _SalaryCurrencyScreenState();
}

class _SalaryCurrencyScreenState extends State<SalaryCurrencyScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_currency".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<SalaryCurrencyController>().getSalaryCurrencyList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: SalaryCurrencyListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_salary_currency",
              onTap: () =>  Get.to(()=> const CreateNewSalaryCurrencyScreen())),
    );
  }
}



