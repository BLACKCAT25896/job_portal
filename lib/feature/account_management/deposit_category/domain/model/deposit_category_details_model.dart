import 'package:mighty_job/helper/price_converter.dart';

class DepositCategoryDetailsModel {
  bool? success;
  int? statusCode;
  String? message;
  DepositCategoryDetailsItem? data;
  DepositCategoryDetailsModel({this.success, this.statusCode, this.message, this.data});
  DepositCategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? DepositCategoryDetailsItem.fromJson(json['data']) : null;

  }

}

class DepositCategoryDetailsItem {
  String? name;
  String? description;
  double? depositsSumAmount;
  String? baseIcon;
  String? icon;
  String? createdAt;
  String? updatedAt;
  List<Deposits>? deposits;

  DepositCategoryDetailsItem({
        this.name,
        this.description,
        this.depositsSumAmount,
        this.baseIcon,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.deposits});

  DepositCategoryDetailsItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    depositsSumAmount = PriceConverter.parseAmount(json['deposits_sum_amount']);
    baseIcon = json['base_icon'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['deposits'] != null) {
      deposits = <Deposits>[];
      json['deposits'].forEach((v) {
        deposits!.add(Deposits.fromJson(v));
      });
    }
  }

}

class Deposits {
  String? date;
  String? amount;
  String? notes;
  String? createdAt;


  Deposits(
      {
        this.date,
        this.amount,
        this.notes,
        this.createdAt});

  Deposits.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    notes = json['notes'];
    createdAt = json['created_at'];
  }

}
