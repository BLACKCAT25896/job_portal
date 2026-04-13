

import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class DepositItem {
  String? id;
  String? fundId;
  String? accountId;
  String? depositCategoryId;
  double? amount;
  String? transactionDate;
  String? voucherNo;
  String? receivedFrom;
  String? note;
  String? createdBy;
  String? status;
  String? createdAt;
  DepositCategoryItem? depositCategory;
  AccountItem? account;

  DepositItem(
      {this.id,
        this.fundId,
        this.accountId,
        this.depositCategoryId,
        this.amount,
        this.transactionDate,
        this.voucherNo,
        this.receivedFrom,
        this.note,
        this.createdBy,
        this.status,
        this.createdAt,
        this.depositCategory,
        this.account
      });

  DepositItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    fundId = json['fund_id'].toString();
    accountId = json['account_id'].toString();
    depositCategoryId = json['deposit_category_id'].toString();
    amount = PriceConverter.parseAmount(json['amount']);
    transactionDate = json['transaction_date'];
    voucherNo = json['voucher_no'].toString();
    receivedFrom = json['received_from'];
    note = json['note'];
    createdBy = json['created_by'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['created_at'] = createdAt;
    return data;
  }
}

