

import 'package:mighty_job/helper/price_converter.dart';

class AwardItem {
  String? id;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  String? title;
  String? description;
  String? dateAwarded;
  double? amount;
  String? awardType;
  String? status;

  AwardItem(
      {this.id,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.title,
        this.description,
        this.dateAwarded,
        this.amount,
        this.awardType,
        this.status,});

  AwardItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    title = json['title'];
    description = json['description'];
    dateAwarded = json['date_awarded'];
    amount = PriceConverter.parseAmount(json['amount']);
    awardType = json['award_type'];
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['department_name'] = departmentName;
    data['designation_title'] = designationTitle;
    data['title'] = title;
    data['description'] = description;
    data['date_awarded'] = dateAwarded;
    data['amount'] = amount;
    data['award_type'] = awardType;
    data['status'] = status;
    return data;
  }
}
