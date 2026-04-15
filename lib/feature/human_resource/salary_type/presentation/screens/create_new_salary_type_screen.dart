import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/widgets/add_new_salary_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/salary_type/domain/models/salary_type_model.dart';

class CreateNewSalaryTypeScreen extends StatefulWidget {
  final SalaryTypeItem? salaryTypeItem;
  const CreateNewSalaryTypeScreen({super.key, this.salaryTypeItem});

  @override
  State<CreateNewSalaryTypeScreen> createState() => _CreateNewSalaryTypeScreenState();
}

class _CreateNewSalaryTypeScreenState extends State<CreateNewSalaryTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_type".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
              child: AddNewSalaryTypeWidget(salaryTypeItem: widget.salaryTypeItem))
        ]));
  }
}
