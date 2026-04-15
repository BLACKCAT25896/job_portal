import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';

class PriceConverter {

  static String convertPrice(BuildContext context, double price, {double? discount, String? discountType}) {
    String decimal =  '2';
    String symbol = Get.find<SystemSettingsController>().generalSettingModel?.data?.currencySymbol??'\$';
    String finalResult;
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price - discount;
      }else if(discountType == 'percent') {
        price = price - ((discount / 100) * price);
      }
    }
    finalResult = '$symbol ''${(price).toStringAsFixed(int.parse(decimal)).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
    return finalResult;
  }

  static double convertWithDiscount(BuildContext context, double price, double discount, String discountType) {
    if(discountType == 'amount') {
      price = price - discount;
    }else if(discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double taxCalculate(double price, double taxAmount) {

    price = ((taxAmount / 100) * price);
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : '\$'} OFF';
  }
  static double parseAmount(dynamic amount) {
    if (amount == null) return 0.0;

    try {
      if (amount is num) {
        return amount.toDouble();
      }

      String value = amount.toString().replaceAll(',', '').trim();

      if (value.isEmpty) return 0.0;

      return double.parse(value);
    } catch (e) {
      return 0.0;
    }
  }

  static bool parseBool(dynamic value) {
    if (value == null) return false;

    if (value is bool) return value;

    if (value is int) return value == 1;

    if (value is double) return value.toInt() == 1;

    if (value is String) {
      final v = value.toLowerCase().trim();
      return v == 'true' || v == '1' || v == 'yes';
    }

    return false;
  }

  static int parseInt(dynamic number) {
    if (number == null) return 0;

    if (number is int) return number;

    if (number is double) return number.toInt();

    if (number is String) {
      if (number.isEmpty) return 0;
      return double.tryParse(number)?.toInt() ?? 0;
    }

    return 0;
  }
  static String priceWithSymbol(double amount){
    return '${Get.find<SystemSettingsController>().generalSettingModel?.data?.currencySymbol??'\$'} ${amount.toStringAsFixed(2)}';
  }

  static double discountCalculation(BuildContext context,double price, double discount, String? discountType) {
    if(discountType == 'amount') {
      discount =  discount;
    }else if(discountType == 'percent') {
      discount =  ((discount / 100) * price);
    }
    return discount;
  }

}