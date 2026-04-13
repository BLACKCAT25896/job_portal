
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class ExpenseCategoryDetailsModel {
  bool? success;
  int? statusCode;
  String? message;
  ExpenseCategory? data;


  ExpenseCategoryDetailsModel({this.success, this.statusCode, this.message, this.data,});

  ExpenseCategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? ExpenseCategory.fromJson(json['data']) : null;

  }
}

class ExpenseCategory {
  int? id;
  String? name;
  String? description;
  double? expensesSumAmount;
  String? baseIcon;
  String? icon;
  List<Expenses>? expenses;

  ExpenseCategory(
      {this.id,
        this.name,
        this.description,
        this.expensesSumAmount,
        this.baseIcon,
        this.icon,
        this.expenses});

  ExpenseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    expensesSumAmount = PriceConverter.parseAmount(json['expenses_sum_amount']);
    baseIcon = json['base_icon'];
    icon = json['icon'];
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(Expenses.fromJson(v));
      });
    }
  }

}


