import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/widgets/add_new_salary_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:mighty_job/feature/human_resource/salary_type/domain/models/salary_type_model.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/widgets/salary_type_item_widget.dart';

class SalaryTypeListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const SalaryTypeListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryTypeController>(
      initState: (val) => Get.find<SalaryTypeController>().getSalaryTypeList(1),
      builder: (salaryTypeController) {
        final salaryTypeModel = salaryTypeController.salaryTypeModel;
        final salaryTypeData = salaryTypeModel?.data;
        return GenericListSection<SalaryTypeItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["salary_type_list".tr],
          addNewTitle: "add_new_salary_type".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "salary_type".tr,
              child: const AddNewSalaryTypeWidget())),
          headings: const ["name","type", "default_amount","visible_pay_slip", "taxable", "status",],
          scrollController: scrollController,
          isLoading: salaryTypeModel == null,
          totalSize: salaryTypeData?.total ?? 0,
          offset: salaryTypeData?.currentPage ?? 0,
          onPaginate: (offset) async => await salaryTypeController.getSalaryTypeList(offset ?? 1),
          items: salaryTypeData?.data ?? [],
          itemBuilder: (item, index) => SalaryTypeItemWidget(index: index, salaryTypeItem: item),
        );
      },
    );
  }
}