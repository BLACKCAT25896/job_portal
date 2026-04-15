
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/screens/create_new_salary_generate_screen.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/widgets/salary_generate_list_widget.dart';

class SalaryGenerateScreen extends StatefulWidget {
  const SalaryGenerateScreen({super.key});

  @override
  State<SalaryGenerateScreen> createState() => _SalaryGenerateScreenState();
}

class _SalaryGenerateScreenState extends State<SalaryGenerateScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_generate".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: SalaryGenerateListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewSalaryGenerateScreen())));
  }
}



