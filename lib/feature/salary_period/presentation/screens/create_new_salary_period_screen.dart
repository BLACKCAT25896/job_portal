
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/add_new_salary_period_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewSalaryPeriodScreen extends StatefulWidget {
  final SalaryPeriodItem? salaryPeriodItem;
  const CreateNewSalaryPeriodScreen({super.key, this.salaryPeriodItem});

  @override
  State<CreateNewSalaryPeriodScreen> createState() => _CreateNewSalaryPeriodScreenState();
}

class _CreateNewSalaryPeriodScreenState extends State<CreateNewSalaryPeriodScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_period".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "salary_period".tr,
              pathItems: ["add_new_salary_period".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewSalaryPeriodWidget(salaryPeriodItem: widget.salaryPeriodItem),
            ),
          ],
        ))
      ],),
    );
  }
}
