

import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class ExpenseItem {
  String? id;
  String? fundId;
  String? accountId;
  String? expenseCategoryId;
  double? amount;
  String? transactionDate;
  String? voucherNo;
  String? receivedFrom;
  String? note;
  String? createdBy;
  String? status;
  String? createdAt;
  AccountItem? account;
  ExpenseCategoryItem? expenseCategory;

  ExpenseItem(
      {this.id,
        this.fundId,
        this.accountId,
        this.expenseCategoryId,
        this.amount,
        this.transactionDate,
        this.voucherNo,
        this.receivedFrom,
        this.note,
        this.createdBy,
        this.status,
        this.createdAt,
        this.account,
        this.expenseCategory
      });

  ExpenseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    fundId = json['fund_id'].toString();
    accountId = json['account_id'].toString();
    expenseCategoryId = json['expense_category_id'].toString();
    amount = PriceConverter.parseAmount(json['amount']);
    transactionDate = json['transaction_date'];
    voucherNo = json['voucher_no'].toString();
    receivedFrom = json['received_from'];
    note = json['note'];
    createdBy = json['created_by'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fund_id'] = fundId;
    data['account_id'] = accountId;
    data['expense_category_id'] = expenseCategoryId;
    data['amount'] = amount;
    data['transaction_date'] = transactionDate;
    data['voucher_no'] = voucherNo;
    data['received_from'] = receivedFrom;
    data['note'] = note;
    data['created_by'] = createdBy;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}




