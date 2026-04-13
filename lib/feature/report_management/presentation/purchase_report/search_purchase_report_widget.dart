import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/from_to_date_selection_widget.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/util/dimensions.dart';

class SearchPurchaseReportWidget extends StatelessWidget {
  final String? type;
  const SearchPurchaseReportWidget({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      builder: (datePickerController) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(showShadow: false,borderRadius: 5,
            child: FromToDateSelectionWidget(onTap: (){
              String fromDate = datePickerController.formatedFromDate;
              String toDate = datePickerController.formatedToDate;
               if(type == "stock"){
                Get.find<ReportController>().getStockReport(1, startDate: fromDate, endDate: toDate);
              }else if(type == "opening_stock"){
                Get.find<ReportController>().getStockOpeningReport();
              }else {
                Get.find<ReportController>().getPurchaseReport(1, startDate: fromDate, endDate: toDate);
              }
            },),
          ),
        );
      }
    );
  }
}
