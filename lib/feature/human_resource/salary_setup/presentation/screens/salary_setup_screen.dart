
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/presentation/screens/create_new_salary_setup_screen.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/presentation/widgets/salary_setup_list_widget.dart';

class SalarySetupScreen extends StatefulWidget {
  const SalarySetupScreen({super.key});

  @override
  State<SalarySetupScreen> createState() => _SalarySetupScreenState();
}

class _SalarySetupScreenState extends State<SalarySetupScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_Setup".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: SalarySetupListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewSalarySetupScreen())));
  }
}



