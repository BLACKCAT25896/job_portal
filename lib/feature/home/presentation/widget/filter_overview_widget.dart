import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectSalesOverViewTypeWidget extends StatefulWidget {
  const SelectSalesOverViewTypeWidget({super.key});

  @override
  State<SelectSalesOverViewTypeWidget> createState() => _SelectSalesOverViewTypeWidgetState();
}

class _SelectSalesOverViewTypeWidgetState extends State<SelectSalesOverViewTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      GetBuilder<ReportController>(
          builder: (reportController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(
                title: "select".tr,
                items:  reportController.reportOverviewTypes,
                selectedValue: reportController.selectedReportOverviewType,
                getLabel: (item) => item.tr,
                onChanged: (val) {
                  reportController.updateSelectedReportOverviewType(val!);
                },
              ),
            );
          }
      ),
    ],
    );
  }
}
