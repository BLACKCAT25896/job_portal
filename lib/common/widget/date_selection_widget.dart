import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/util/styles.dart';

class DateSelectionWidget extends StatelessWidget {
  final String? title;
  const DateSelectionWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      builder: (datePickerController) {
        return InkWell(onTap: ()=> datePickerController.setSelectDate(context, fromDate: true),
            child: CustomTextField(title: title?? "date".tr,
                isEnabled : false,
                hintText: DateConverter.quotationDateAndTime(datePickerController.selectedDateTime?? DateTime.now())));
      }
    );
  }
}

class GenericDateSelectionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController controller;

  const GenericDateSelectionWidget({super.key, required this.onTap, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: CustomTextField(
        hintText: DateConverter.quotationDateAndTime(DateTime.now()),
        controller: controller, isEnabled: false));
  }
}




class ExpiryDateSelectionWidget extends StatelessWidget {
  final String? title;
  const ExpiryDateSelectionWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(builder: (datePickerController) {
      return InkWell(onTap: ()=> datePickerController.setSelectDate(context, fromDate: false),
          child: CustomTextField(title: title?? "date".tr,
              isEnabled : false,
              hintText: DateConverter.quotationDate(datePickerController.selectedToDate)));
        }
    );
  }
}


class TimeSelectionWidget extends StatelessWidget {
  final String? title;
  final bool endTime;
  const TimeSelectionWidget({super.key, this.title, this.endTime = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
        builder: (datePickerController) {
          return InkWell(onTap: ()=> datePickerController.setSelectTime(context, end: endTime),
            child: CustomTextField(title: title?? "time".tr, isEnabled : false,
              hintStyle: textRegular.copyWith(color: Theme.of(context).textTheme.displayLarge?.color),
              hintText: endTime? datePickerController.formatedEndTime :
              datePickerController.formatedTime,
              suffix : const Icon(CupertinoIcons.time),
            ),

          );
        }
    );
  }
}

