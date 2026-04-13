

import 'package:ecommerce/helper/price_converter.dart';
class SalarySetupItem {
  int? id;
  int? employeeId;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  int? salaryTypeId;
  String? salaryTypeName;
  double? amount;
  String? calculationType;
  String? notes;
  int? status;
  String? createdAt;

  SalarySetupItem(
      {this.id,
        this.employeeId,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.salaryTypeId,
        this.salaryTypeName,
        this.amount,
        this.calculationType,
        this.notes,
        this.status,
        this.createdAt});

  SalarySetupItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = PriceConverter.parseInt(json['employee_id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    salaryTypeId = PriceConverter.parseInt(json['salary_type_id']);
    salaryTypeName = json['salary_type_name'];
    amount = PriceConverter.parseAmount(json['amount']);
    calculationType = json['calculation_type'];
    notes = json['notes'];
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
    data['salary_type_id'] = salaryTypeId;
    data['salary_type_name'] = salaryTypeName;
    data['amount'] = amount;
    data['calculation_type'] = calculationType;
    data['notes'] = notes;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}



