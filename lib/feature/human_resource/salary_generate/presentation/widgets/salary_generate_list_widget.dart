import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/widgets/add_new_salary_generate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/controller/salary_generate_controller.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/domain/models/salary_generate_model.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/widgets/salary_generate_item_widget.dart';

class SalaryGenerateListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const SalaryGenerateListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryGenerateController>(
      initState: (val) => Get.find<SalaryGenerateController>().getSalaryGenerateList(1),
      builder: (salaryGenerateController) {
        final salaryGenerateModel = salaryGenerateController.salaryGenerateModel;
        final salaryGenerateData = salaryGenerateModel?.data;
        return GenericListSection<SalaryGenerateItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["salary_generate_list".tr],
          addNewTitle: "add_new_salary_generate".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "salary_generate".tr,
              child: const AddNewSalaryGenerateWidget())),
          headings: const ["name", "month", "basic_salary", "total_earnings", "total_deductions", "overtime_hours", "overtime_amount", "net_salary"],
          scrollController: scrollController,
          isLoading: salaryGenerateModel == null,
          totalSize: salaryGenerateData?.total ?? 0,
          offset: salaryGenerateData?.currentPage ?? 0,
          onPaginate: (offset) async => await salaryGenerateController.getSalaryGenerateList(offset ?? 1),
          items: salaryGenerateData?.data ?? [],
          itemBuilder: (item, index) => SalaryGenerateItemWidget(index: index, salaryGenerateItem: item),
        );
      },
    );
  }
}