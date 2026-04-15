import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/widgets/add_new_salary_generate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/domain/models/salary_generate_model.dart';

class CreateNewSalaryGenerateScreen extends StatefulWidget {
  final SalaryGenerateItem? salaryGenerateItem;
  const CreateNewSalaryGenerateScreen({super.key, this.salaryGenerateItem});

  @override
  State<CreateNewSalaryGenerateScreen> createState() => _CreateNewSalaryGenerateScreenState();
}

class _CreateNewSalaryGenerateScreenState extends State<CreateNewSalaryGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "generate_salary".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
              child: AddNewSalaryGenerateWidget(salaryGenerateItem: widget.salaryGenerateItem))
        ]));
  }
}
