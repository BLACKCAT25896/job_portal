
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/screens/create_new_loan_installment_screen.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/widgets/loan_installment_list_widget.dart';

class LoanInstallmentScreen extends StatefulWidget {
  const LoanInstallmentScreen({super.key});

  @override
  State<LoanInstallmentScreen> createState() => _LoanInstallmentScreenState();
}

class _LoanInstallmentScreenState extends State<LoanInstallmentScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "loan_installment".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: LoanInstallmentListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewLoanInstallmentScreen())));
  }
}



