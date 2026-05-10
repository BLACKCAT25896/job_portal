import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/controller/date_picker_controller.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/helper/date_converter.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class FromDateToDateWidget extends StatelessWidget {
  const FromDateToDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      builder: (datePickerController) {
        return Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Row(children: [
            Expanded(child: InkWell(onTap: ()=> datePickerController.setSelectDate(context, fromDate: true),
                child: CustomTextField(title: "from_date".tr,
                    isEnabled : false,
                    hintStyle: textRegular.copyWith(color: Theme.of(context).textTheme.displayLarge?.color),
                    hintText: DateConverter.quotationDate(datePickerController.selectedDate))),
            ),

            const SizedBox(width: 10,),
            Expanded(child: InkWell(onTap: ()=> datePickerController.setSelectDate(context),
                child: CustomTextField(title: "to_date".tr,
                    isEnabled : false,
                    hintStyle: textRegular.copyWith(color: Theme.of(context).textTheme.displayLarge?.color),
                    hintText: DateConverter.quotationDate(datePickerController.selectedToDate))),
            ),
          ],
          ),
        );
      }
    );
  }
}
