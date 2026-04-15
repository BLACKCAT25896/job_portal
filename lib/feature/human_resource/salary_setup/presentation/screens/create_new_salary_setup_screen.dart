import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/presentation/widgets/add_new_salary_setup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_model.dart';

class CreateNewSalarySetupScreen extends StatefulWidget {
  final SalarySetupItem? salarySetupItem;
  const CreateNewSalarySetupScreen({super.key, this.salarySetupItem});

  @override
  State<CreateNewSalarySetupScreen> createState() => _CreateNewSalarySetupScreenState();
}

class _CreateNewSalarySetupScreenState extends State<CreateNewSalarySetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_setup".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
              child: AddNewSalarySetupWidget(salarySetupItem: widget.salarySetupItem))
        ]));
  }
}
