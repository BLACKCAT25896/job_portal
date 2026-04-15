import 'package:mighty_job/helper/price_converter.dart';

class LoanInstallmentItem {
  String? id;
  int? loanId;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  double? amount;
  String? dueDate;
  String? isPaid;
  String? remarks;
  String? status;
  String? createdAt;

  LoanInstallmentItem(
      {this.id,
        this.loanId,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.amount,
        this.dueDate,
        this.isPaid,
        this.remarks,
        this.status,
        this.createdAt,});

  LoanInstallmentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    loanId = PriceConverter.parseInt(json['loan_id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    amount = PriceConverter.parseAmount(json['amount']);
    dueDate = json['due_date'];
    isPaid = json['is_paid'].toString();
    remarks = json['remarks'];
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_id'] = loanId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['department_name'] = departmentName;
    data['designation_title'] = designationTitle;
    data['amount'] = amount;
    data['due_date'] = dueDate;
    data['is_paid'] = isPaid;
    data['remarks'] = remarks;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}