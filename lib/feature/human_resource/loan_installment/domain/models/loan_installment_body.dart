class LoanInstallmentBody {
  int? loanId;
  String? amount;
  String? dueDate;
  String? paidDate;
  String? remarks;
  String? method;

  LoanInstallmentBody(
      {this.loanId,
        this.amount,
        this.dueDate,
        this.paidDate,
        this.remarks,
        this.method
      });

  LoanInstallmentBody.fromJson(Map<String, dynamic> json) {
    loanId = json['loan_id'];
    amount = json['amount'];
    dueDate = json['due_date'];
    paidDate = json['paid_date'];
    remarks = json['remarks'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_id'] = loanId;
    data['amount'] = amount;
    data['due_date'] = dueDate;
    data['paid_date'] = paidDate;
    data['remarks'] = remarks;
    data['_method'] = method;
    return data;
  }
}
