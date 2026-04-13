import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/loan/presentation/widgets/add_new_loan_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/models/loan_model.dart';
import 'package:ecommerce/feature/human_resource/loan/presentation/widgets/loan_item_widget.dart';

class LoanListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LoanListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanController>(
      initState: (val) => Get.find<LoanController>().getLoanList(1),
      builder: (loanController) {
        final loanModel = loanController.loanModel;
        final loanData = loanModel?.data;

        return GenericListSection<LoanItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["loan_list".tr],
          addNewTitle: "add_new_loan".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "loan".tr,
              child: const AddNewLoanWidget())),
          headings: const ["name","amount","installments","type","paid_amount","start_date","end_date", "status",],

          scrollController: scrollController,
          isLoading: loanModel == null,
          totalSize: loanData?.total ?? 0,
          offset: loanData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await loanController.getLoanList(offset ?? 1),

          items: loanData?.data ?? [],
          itemBuilder: (item, index) => LoanItemWidget(
            index: index,
            loanItem: item,
          ),
        );
      },
    );
  }
}