
import 'package:mighty_job/helper/price_converter.dart';

class ExpenseCategoryItem {
  int? id;
  String? name;
  String? status;
  ExpenseCategoryItem({this.id, this.name, this.status});

  ExpenseCategoryItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    status = json['status'].toString();
  }

}



class Expenses {
  int? id;
  String? date;
  String? ref;
  String? details;
  String? amount;
  String? createdAt;


  Expenses(
      {this.id,
        this.date,
        this.ref,
        this.details,
        this.amount,
        this.createdAt});

  Expenses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    ref = json['ref'];
    details = json['details'];
    amount = json['amount'].toString();
    createdAt = json['created_at'];
  }

}
