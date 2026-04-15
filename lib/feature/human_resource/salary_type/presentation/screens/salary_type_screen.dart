
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/screens/create_new_salary_type_screen.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/widgets/salary_type_list_widget.dart';

class SalaryTypeScreen extends StatefulWidget {
  const SalaryTypeScreen({super.key});

  @override
  State<SalaryTypeScreen> createState() => _SalaryTypeScreenState();
}

class _SalaryTypeScreenState extends State<SalaryTypeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_type".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: SalaryTypeListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewSalaryTypeScreen())));
  }
}



