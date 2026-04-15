import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateSelectionButtonWidget extends StatelessWidget {
  final Function()? onTap;
  const DateSelectionButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      builder: (datePickerController) {
        return CustomContainer(onTap: onTap, borderRadius: 5, verticalPadding: 10,
            child : Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
              SizedBox(width: 15, child: Image.asset(Images.calender)),
              Text("${datePickerController.formatedFromDate}  ->  ${datePickerController.formatedToDate}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
            ],));
      }
    );
  }
}
