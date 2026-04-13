class SalaryGenerateBody {
  int? employeeId;
  String? month;
  String? basicSalary;
  String? totalEarnings;
  String? totalDeductions;
  String? overtimeHours;
  String? overtimeAmount;
  String? netSalary;
  String? generatedDate;
  int? generatedBy;
  String? status;
  SalaryBreakdown? salaryBreakdown;

  SalaryGenerateBody(
      {this.employeeId,
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
        this.salaryBreakdown});

  SalaryGenerateBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    month = json['month'];
    basicSalary = json['basic_salary'];
    totalEarnings = json['total_earnings'];
    totalDeductions = json['total_deductions'];
    overtimeHours = json['overtime_hours'];
    overtimeAmount = json['overtime_amount'];
    netSalary = json['net_salary'];
    generatedDate = json['generated_date'];
    generatedBy = json['generated_by'];
    status = json['status'];
    salaryBreakdown = json['salary_breakdown'] != null
        ? SalaryBreakdown.fromJson(json['salary_breakdown'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
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
    if (salaryBreakdown != null) {
      data['salary_breakdown'] = salaryBreakdown!.toJson();
    }
    return data;
  }
}

class SalaryBreakdown {
  String? basic;
  String? hra;
  String? transport;
  String? tax;
  String? bonus;
  String? overtime;

  SalaryBreakdown(
      {this.basic,
        this.hra,
        this.transport,
        this.tax,
        this.bonus,
        this.overtime});

  SalaryBreakdown.fromJson(Map<String, dynamic> json) {
    basic = json['basic'];
    hra = json['hra'];
    transport = json['transport'];
    tax = json['tax'];
    bonus = json['bonus'];
    overtime = json['overtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['basic'] = basic;
    data['hra'] = hra;
    data['transport'] = transport;
    data['tax'] = tax;
    data['bonus'] = bonus;
    data['overtime'] = overtime;
    return data;
  }
}
