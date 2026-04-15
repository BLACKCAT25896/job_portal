import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/presentation/widgets/add_new_salary_setup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/controller/salary_setup_controller.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_model.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/presentation/widgets/salary_setup_item_widget.dart';

class SalarySetupListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const SalarySetupListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalarySetupController>(
      initState: (val) => Get.find<SalarySetupController>().getSalarySetupList(1),
      builder: (salarySetupController) {
        final salarySetupModel = salarySetupController.salarySetupModel;
        final salarySetupData = salarySetupModel?.data;
        return GenericListSection<SalarySetupItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["salary_setup_list".tr],
          addNewTitle: "add_new_salary_setup".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "salary_setup".tr,
              child: const AddNewSalarySetupWidget())),
          headings: const ["name", "salary_type", "amount", "status",],
          scrollController: scrollController,
          isLoading: salarySetupModel == null,
          totalSize: salarySetupData?.total ?? 0,
          offset: salarySetupData?.currentPage ?? 0,
          onPaginate: (offset) async => await salarySetupController.getSalarySetupList(offset ?? 1),
          items: salarySetupData?.data ?? [],
          itemBuilder: (item, index) => SalarySetupItemWidget(index: index, salarySetupItem: item),
        );
      },
    );
  }
}