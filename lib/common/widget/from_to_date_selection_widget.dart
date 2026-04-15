import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromToDateSelectionWidget extends StatelessWidget {
  final Function()? onTap;
  const FromToDateSelectionWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
        builder: (datePickerController) {
          return Row(spacing: Dimensions.paddingSizeSmall,
              crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(child: InkWell(onTap: ()=> datePickerController.setSelectDate(context, fromDate: true),
                child: CustomTextField(title: "from_date".tr, isEnabled : false,
                    hintText: DateConverter.quotationDate(datePickerController.selectedDate)))),


            Expanded(child: InkWell(onTap: ()=> datePickerController.setSelectDate(context),
                child: CustomTextField(title: "to_date".tr, isEnabled : false,
                    hintText: DateConverter.quotationDate(datePickerController.selectedToDate)))),

              if(onTap != null)
              CustomButton(onTap: onTap, text: "submit".tr, width: 100,),
          ]);
        }
      );
  }
}
