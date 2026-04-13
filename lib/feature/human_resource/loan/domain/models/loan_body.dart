class LoanBody {
  int? employeeId;
  String? amount;
  int? installments;
  String? paidAmount;
  String? status;
  String? loanType;
  String? remarks;
  String? startDate;
  String? endDate;
  String? method;

  LoanBody(
      {this.employeeId,
        this.amount,
        this.installments,
        this.paidAmount,
        this.status,
        this.loanType,
        this.remarks,
        this.startDate,
        this.endDate,
        this.method
      });

  LoanBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    amount = json['amount'];
    installments = json['installments'];
    paidAmount = json['paid_amount'];
    status = json['status'];
    loanType = json['loan_type'];
    remarks = json['remarks'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['amount'] = amount;
    data['installments'] = installments;
    data['paid_amount'] = paidAmount;
    data['status'] = status;
    data['loan_type'] = loanType;
    data['remarks'] = remarks;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['_method'] = method;
    return data;
  }
}
