class SalarySetupBody {
  int? employeeId;
  int? salaryTypeId;
  String? amount;
  String? calculationType;
  String? notes;
  int? status;
  String? method;

  SalarySetupBody(
      {this.employeeId,
        this.salaryTypeId,
        this.amount,
        this.calculationType,
        this.notes,
        this.status,
        this.method
      });

  SalarySetupBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    salaryTypeId = json['salary_type_id'];
    amount = json['amount'];
    calculationType = json['calculation_type'];
    notes = json['notes'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['salary_type_id'] = salaryTypeId;
    data['amount'] = amount;
    data['calculation_type'] = calculationType;
    data['notes'] = notes;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
