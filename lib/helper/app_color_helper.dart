import 'package:ecommerce/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Color systemPrimaryColor() {
  return Get.find<SystemSettingsController>().primaryColor;
}
