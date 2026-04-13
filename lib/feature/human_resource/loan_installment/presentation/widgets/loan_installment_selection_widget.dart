import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/controller/loan_installment_controller.dart';

class SelectLoanInstallmentWidget extends StatefulWidget {
  const SelectLoanInstallmentWidget({super.key});

  @override
  State<SelectLoanInstallmentWidget> createState() => _SelectLoanInstallmentWidgetState();
}

class _SelectLoanInstallmentWidgetState extends State<SelectLoanInstallmentWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<LoanInstallmentController>();
    if (controller.loanInstallmentModel == null) {
      controller.getLoanInstallmentList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "loan_installment"),
        GetBuilder<LoanInstallmentController>(builder: (loanController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_loan_installment".tr,
                items: loanController.loanInstallmentModel?.data?.data ?? [],
                selectedValue: loanController.selectedLoanInstallmentItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    loanController.selectLoanInstallment(val);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
