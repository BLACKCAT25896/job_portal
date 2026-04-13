import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/widgets/add_new_loan_installment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_model.dart';

class CreateNewLoanInstallmentScreen extends StatefulWidget {
  final LoanInstallmentItem? loanInstallmentItem;
  const CreateNewLoanInstallmentScreen({super.key, this.loanInstallmentItem});

  @override
  State<CreateNewLoanInstallmentScreen> createState() => _CreateNewLoanInstallmentScreenState();
}

class _CreateNewLoanInstallmentScreenState extends State<CreateNewLoanInstallmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "loan_installment".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
              child: AddNewLoanInstallmentWidget(loanInstallmentItem: widget.loanInstallmentItem))
        ]));
  }
}
