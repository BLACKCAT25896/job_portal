

import 'package:ecommerce/feature/pos/domain/repository/pos_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosController extends GetxController implements GetxService{
  final PosRepository posRepository;
  PosController({required this.posRepository});



  final TextEditingController _collectedCashController = TextEditingController();
  TextEditingController get collectedCashController => _collectedCashController;

  final TextEditingController _extraDiscountController = TextEditingController();
  TextEditingController get extraDiscountController => _extraDiscountController;


  List<String> paymentsTypeList = ["cash", "card", "mfs"];
  String? selectedPaymentType = "cash";
  void setSelectedType(String type){
    selectedPaymentType = type;
    update();
  }

  String? getBluetoothMacAddress() => posRepository.getBluetoothAddress();

  void setBluetoothMacAddress(String? address) => posRepository.setBluetoothAddress(address);

}