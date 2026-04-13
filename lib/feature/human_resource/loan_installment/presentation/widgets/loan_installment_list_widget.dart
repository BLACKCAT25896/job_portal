import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/widgets/add_new_loan_installment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/controller/loan_installment_controller.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_model.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/widgets/loan_installment_item_widget.dart';

class LoanInstallmentListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LoanInstallmentListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanInstallmentController>(
      initState: (val) => Get.find<LoanInstallmentController>().getLoanInstallmentList(1),
      builder: (loanInstallmentController) {
        final loanInstallmentModel = loanInstallmentController.loanInstallmentModel;
        final loanData = loanInstallmentModel?.data;

        return GenericListSection<LoanInstallmentItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["loan_installment_list".tr],
          addNewTitle: "add_new_loan_installment".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "loan_installment".tr,
              child: const AddNewLoanInstallmentWidget())),
          headings: const ["name",  "amount", "due_date", "is_paid", "remarks"],

          scrollController: scrollController,
          isLoading: loanInstallmentModel == null,
          totalSize: loanData?.total ?? 0,
          offset: loanData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await loanInstallmentController.getLoanInstallmentList(offset ?? 1),

          items: loanData?.data ?? [],
          itemBuilder: (item, index) => LoanInstallmentItemWidget(index: index, loanInstallmentItem: item),
        );
      },
    );
  }
}