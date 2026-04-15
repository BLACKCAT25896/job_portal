import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectLoanWidget extends StatefulWidget {
  const SelectLoanWidget({super.key});

  @override
  State<SelectLoanWidget> createState() => _SelectLoanWidgetState();
}

class _SelectLoanWidgetState extends State<SelectLoanWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<LoanController>();
    if (controller.loanModel == null) {
      controller.getLoanList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("loan".tr, style: textRegular)),

        GetBuilder<LoanController>(builder: (loanController) {
            return CustomGenericDropdown(width: Get.width,
              title: "select".tr,
              items: loanController.loanModel?.data?.data ?? [],
              selectedValue: loanController.selectedLoanItem,
              getLabel: (item) => item.firstName ?? '',
              onChanged: (val) {
                if (val != null) {
                  loanController.selectLoan(val);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
