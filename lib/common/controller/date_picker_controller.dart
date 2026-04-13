import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController implements GetxService {
  // --- existing fields ---
  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime? selectedExpiryDate;
  DateTime selectedToDate = DateTime.now();

  // NEW: holds the final combined date+time
  DateTime? selectedDateTime;

  String? expiryDate;
  String? isoTime;
  String? formatedFromDateAndTime;
  String formatedToDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
  String formatedFromDate = "${DateTime.now().subtract(const Duration(days: 30)).year.toString()}-${DateTime.now().subtract(const Duration(days: 30)).month.toString().padLeft(2,'0')}-${DateTime.now().subtract(const Duration(days: 30)).day.toString().padLeft(2,'0')}";

  Future<void> setSelectDate(BuildContext context, {bool fromDate = false}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ? selectedDate : selectedToDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked == null) return;

    // pick time for both start and end
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final DateTime combinedDateTime = DateTime(
      picked.year,
      picked.month,
      picked.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    if (fromDate) {
      // START DATE
      selectedDate = picked;
      selectedDateTime = combinedDateTime;

      formatedFromDate =
      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

      formatedFromDateAndTime =
      '${combinedDateTime.toUtc().toIso8601String().split('.').first}Z';

      log("Start ISO: $formatedFromDateAndTime");
    } else {
      // END DATE
      selectedToDate = picked;

      // Validate end date > start date
      if (selectedDateTime != null &&
          combinedDateTime.isBefore(selectedDateTime!)) {
        Get.snackbar("Error", "End date must be after start date");
        return;
      }

      isoTime =
      '${combinedDateTime.toUtc().toIso8601String().split('.').first}Z';

      formatedToDate =
      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

      log("End ISO: $isoTime");
    }

    update();
  }


  Future<DateTime?> pickDateTime(BuildContext context) async {
    final ctx = context;
    final DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return null;
    if (!ctx.mounted) return null;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedTime == null) return pickedDate;
    if (!ctx.mounted) return null;
    return DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );
  }



  TimeOfDay? selectedTime;
  TimeOfDay? selectedEndTime;
  String? formatedEndTime;
  String? formatedTime = "${TimeOfDay?.now().hour} : ${TimeOfDay?.now().minute} ${TimeOfDay?.now().period.name}";
  Future<void> setSelectTime(BuildContext context, {bool end = false}) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      selectedTime = picked;

      final now = DateTime.now();
      final startDateTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final endDateTime = startDateTime.add(const Duration(hours: 3));
      selectedEndTime = TimeOfDay(hour: endDateTime.hour, minute: endDateTime.minute);
      formatedTime = "${selectedTime!.hour}:${selectedEndTime!.minute}";
      formatedEndTime = "${selectedEndTime!.hour}:${selectedEndTime!.minute}";

    }

    update();
  }

  void resetDate() {
    selectedDate = DateTime.now();
    selectedToDate = DateTime.now();
    formatedFromDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
    formatedToDate = "";
    update();
  }

  void setDateFromString(String dateString) {
    try {
      selectedDate = DateTime.parse(dateString);
      formatedFromDate = "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2,'0')}-${selectedDate.day.toString().padLeft(2,'0')}";
    } catch (e) {
      log("Error parsing date: $e");
    }
  }

  void setEndDateFromString(String dateString) {
    try {
      selectedToDate = DateTime.parse(dateString);
      formatedToDate = "${selectedToDate.year.toString()}-${selectedToDate.month.toString().padLeft(2,'0')}-${selectedToDate.day.toString().padLeft(2,'0')}";
    } catch (e) {
      log("Error parsing end date: $e");
    }
  }

  void setFromTimeFromString(String timeString) {
    formatedTime = timeString;
  }

  void setToTimeFromString(String timeString) {
    formatedEndTime = timeString;
  }


}
