import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/loan/presentation/widgets/add_new_loan_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/loan/domain/models/loan_model.dart';

class CreateNewLoanScreen extends StatefulWidget {
  final LoanItem? loanItem;
  const CreateNewLoanScreen({super.key, this.loanItem});

  @override
  State<CreateNewLoanScreen> createState() => _CreateNewLoanScreenState();
}

class _CreateNewLoanScreenState extends State<CreateNewLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "loan".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewLoanWidget(loanItem: widget.loanItem))
        ]));
  }
}
