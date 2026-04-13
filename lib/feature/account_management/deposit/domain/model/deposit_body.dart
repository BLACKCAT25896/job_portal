class DepositBody {
  int? fundId;
  int? accountId;
  int? depositCategoryId;
  String? amount;
  String? transactionDate;
  String? voucherNo;
  String? receivedFrom;
  String? note;
  int? createdBy;
  int? status;
  String? sMethod;

  DepositBody(
      {this.fundId,
        this.accountId,
        this.depositCategoryId,
        this.amount,
        this.transactionDate,
        this.voucherNo,
        this.receivedFrom,
        this.note,
        this.createdBy,
        this.status,
        this.sMethod});

  DepositBody.fromJson(Map<String, dynamic> json) {
    fundId = json['fund_id'];
    accountId = json['account_id'];
    depositCategoryId = json['deposit_category_id'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
    voucherNo = json['voucher_no'];
    receivedFrom = json['received_from'];
    note = json['note'];
    createdBy = json['created_by'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fund_id'] = fundId;
    data['account_id'] = accountId;
    data['deposit_category_id'] = depositCategoryId;
    data['amount'] = amount;
    data['transaction_date'] = transactionDate;
    data['voucher_no'] = voucherNo;
    data['received_from'] = receivedFrom;
    data['note'] = note;
    data['created_by'] = createdBy;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
