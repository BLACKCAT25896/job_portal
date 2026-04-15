

import 'package:mighty_job/helper/price_converter.dart';

class LoanItem {
  String? id;
  int? employeeId;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  double? amount;
  int? installments;
  double? paidAmount;
  String? loanType;
  String? remarks;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;

  LoanItem(
      {this.id,
        this.employeeId,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.amount,
        this.installments,
        this.paidAmount,
        this.loanType,
        this.remarks,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt});

  LoanItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    employeeId = PriceConverter.parseInt(json['employee_id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    amount = PriceConverter.parseAmount(json['amount']);
    installments = PriceConverter.parseInt(json['installments']);
    paidAmount = PriceConverter.parseAmount(json['paid_amount']);
    loanType = json['loan_type'];
    remarks = json['remarks'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employee_id'] = employeeId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['department_name'] = departmentName;
    data['designation_title'] = designationTitle;
    data['amount'] = amount;
    data['installments'] = installments;
    data['paid_amount'] = paidAmount;
    data['loan_type'] = loanType;
    data['remarks'] = remarks;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

