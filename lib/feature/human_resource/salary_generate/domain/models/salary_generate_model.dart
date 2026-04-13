

import 'dart:convert';

import 'package:ecommerce/helper/price_converter.dart';


class SalaryGenerateItem {
  int? id;
  String? ecommerceName;
  int? employeeId;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  String? month;
  double? basicSalary;
  double? totalEarnings;
  double? totalDeductions;
  String? overtimeHours;
  double? overtimeAmount;
  double? netSalary;
  String? generatedDate;
  int? generatedBy;
  String? status;
  String? salaryBreakdown;
  String? createdAt;
  SalaryBreakdownModel? salaryBreakdownModel;

  SalaryGenerateItem(
      {this.id,
        this.ecommerceName,
        this.employeeId,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.month,
        this.basicSalary,
        this.totalEarnings,
        this.totalDeductions,
        this.overtimeHours,
        this.overtimeAmount,
        this.netSalary,
        this.generatedDate,
        this.generatedBy,
        this.status,
        this.salaryBreakdown,
        this.createdAt,
        this.salaryBreakdownModel
      });

  SalaryGenerateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecommerceName = json['ecommerce_name'];
    employeeId = PriceConverter.parseInt(json['employee_id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    month = json['month'];
    basicSalary = PriceConverter.parseAmount(json['basic_salary']);
    totalEarnings = PriceConverter.parseAmount(json['total_earnings']);
    totalDeductions = PriceConverter.parseAmount(json['total_deductions']);
    overtimeHours = json['overtime_hours'];
    overtimeAmount = PriceConverter.parseAmount(json['overtime_amount']);
    netSalary = PriceConverter.parseAmount(json['net_salary']);
    generatedDate = json['generated_date'];
    generatedBy = PriceConverter.parseInt(json['generated_by']);
    status = json['status'].toString();
    salaryBreakdown = json['salary_breakdown'];
    if(salaryBreakdown != null){
      salaryBreakdownModel = SalaryBreakdownModel.fromJson(jsonDecode(salaryBreakdown!));
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ecommerce_name'] = ecommerceName;
    data['employee_id'] = employeeId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['department_name'] = departmentName;
    data['designation_title'] = designationTitle;
    data['month'] = month;
    data['basic_salary'] = basicSalary;
    data['total_earnings'] = totalEarnings;
    data['total_deductions'] = totalDeductions;
    data['overtime_hours'] = overtimeHours;
    data['overtime_amount'] = overtimeAmount;
    data['net_salary'] = netSalary;
    data['generated_date'] = generatedDate;
    data['generated_by'] = generatedBy;
    data['status'] = status;
    data['salary_breakdown'] = salaryBreakdown;
    data['created_at'] = createdAt;
    data['salary_breakdown'] = salaryBreakdownModel != null
        ? jsonEncode(salaryBreakdownModel!.toJson())
        : salaryBreakdown;
    return data;
  }
}


class SalaryBreakdownModel {
  String? basic;
  String? hra;
  String? transport;
  String? tax;
  String? bonus;
  String? overtime;

  SalaryBreakdownModel({
    this.basic, this.hra, this.transport, this.tax, this.bonus, this.overtime,
  });

  factory SalaryBreakdownModel.fromJson(Map<String, dynamic> json) {
    return SalaryBreakdownModel(
      basic: json['basic'].toString(),
      hra: json['hra'].toString(),
      transport: json['transport']?.toString(),
      tax: json['tax']?.toString(),
      bonus: json['bonus']?.toString(),
      overtime: json['overtime']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basic': basic,
      'hra': hra,
      'transport': transport,
      'tax': tax,
      'bonus': bonus,
      'overtime': overtime,
    };
  }
}
