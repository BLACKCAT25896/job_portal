class ExpenseBody {
  int? fundId;
  int? accountId;
  int? expenseCategoryId;
  String? amount;
  String? transactionDate;
  String? voucherNo;
  String? receivedFrom;
  String? note;
  String? method;

  ExpenseBody(
      {this.fundId,
        this.accountId,
        this.expenseCategoryId,
        this.amount,
        this.transactionDate,
        this.voucherNo,
        this.receivedFrom,
        this.note,
        this.method});

  ExpenseBody.fromJson(Map<String, dynamic> json) {
    fundId = json['fund_id'];
    accountId = json['account_id'];
    expenseCategoryId = json['expense_category_id'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
    voucherNo = json['voucher_no'];
    receivedFrom = json['received_from'];
    note = json['note'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fund_id'] = fundId;
    data['account_id'] = accountId;
    data['expense_category_id'] = expenseCategoryId;
    data['amount'] = amount;
    data['transaction_date'] = transactionDate;
    data['voucher_no'] = voucherNo;
    data['received_from'] = receivedFrom;
    data['note'] = note;
    data['_method'] = method;
    return data;
  }
}
