import 'package:mighty_job/helper/price_converter.dart';

class PackageModel {
  bool? success;
  int? statusCode;
  String? message;
  List<PackageItem>? data;


  PackageModel(
      {this.success, this.statusCode, this.message, this.data});

  PackageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PackageItem>[];
      json['data'].forEach((v) {
        data!.add(PackageItem.fromJson(v));
      });
    }
  }

}

class PackageItem {
  int? id;
  String? name;
  String? nameBn;
  String? description;
  String? descriptionBn;
  int? durationInDays;
  double? amount;
  double? afterAmount;
  double? discount;
  String? packageType;



  PackageItem(
      {this.id,
        this.name,
        this.nameBn,
        this.description,
        this.descriptionBn,
        this.durationInDays,
        this.amount,
        this.afterAmount,
        this.discount,
        this.packageType,
       });

  PackageItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    durationInDays = json['duration_in_days'];
    amount = PriceConverter.parseAmount(json['amount']);
    afterAmount = PriceConverter.parseAmount(json['after_amount']);
    discount = PriceConverter.parseAmount(json['discount']);
    packageType = json['package_type'];

  }

}
