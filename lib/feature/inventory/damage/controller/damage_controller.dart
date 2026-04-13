import 'dart:developer';

import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_body.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_model.dart';
import 'package:ecommerce/feature/inventory/damage/domain/repository/damage_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DamageController extends GetxController implements GetxService{
  final DamageRepository damageRepository;
  DamageController({required this.damageRepository});


  bool isLoading = false;
  DamageModel? damageModel;
  Future<void> getDamageList(int offset) async {
    Response? response = await damageRepository.getDamageList(offset);
    if (response?.statusCode == 200) {
      if(offset == 1){
        damageModel = DamageModel.fromJson(response?.body);
      }else{
        damageModel?.data?.data?.data?.addAll(DamageModel.fromJson(response?.body).data?.data?.data??[]);
        damageModel?.data?.data?.currentPage = DamageModel.fromJson(response?.body).data?.data?.currentPage;
        damageModel?.data?.data?.total = DamageModel.fromJson(response?.body).data?.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }



  List<String> damageTypes = ['natural_damage', 'handling_damage', 'expired', 'theft', 'other'];
  String? selectedDamageType;
  void setSelectedDamageType(String type) {
    selectedDamageType = type;
    update();
  }



  DateTime selectedDate = DateTime.now();
  String formatedDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
  Future<void> setSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      formatedDate = "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2,'0')}-${selectedDate.day.toString().padLeft(2,'0')}";
      log("message=== $selectedDate");
    }
    update();
  }


  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }



  Future<void> createDamage(DamageBody damageBody) async {
    isLoading = true;
    update();
    Response? response = await damageRepository.createDamage(damageBody, thumbnail);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDamageList(1);
      Get.toNamed(RouteHelper.getDamageRoute());

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDamage(DamageBody damageBody, int id) async {
    isLoading = true;
    update();
    Response? response = await damageRepository.updateDamage(damageBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDamageList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }



  Future<Response> deleteDamage(int id) async {
    isLoading = true;
    Response? response = await damageRepository.deleteDamage(id);
    if (response?.statusCode == 200) {
      getDamageList(1);
      Get.back();
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
    return response!;
  }
}