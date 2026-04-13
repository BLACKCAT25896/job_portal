import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
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
