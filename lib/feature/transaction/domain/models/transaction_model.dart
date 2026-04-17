

import 'package:mighty_job/helper/price_converter.dart';

class TransactionItem {
  int? id;
  int? userId;
  String? invoiceId;
  String? amount;
  int? status;
  int? isApproved;
  int? approvedId;
  int? ownerId;
  String? ownerType;
  int? planCurrencyId;

  TransactionItem(
      {this.id,
        this.userId,
        this.invoiceId,
        this.amount,
        this.status,
        this.isApproved,
        this.approvedId,
        this.ownerId,
        this.ownerType,
        this.planCurrencyId,
        });

  TransactionItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    userId = PriceConverter.parseInt(json['user_id']);
    invoiceId = json['invoice_id'];
    amount = json['amount'];
    status = PriceConverter.parseInt(json['status']);
    isApproved = PriceConverter.parseInt(json['is_approved']);
    approvedId = PriceConverter.parseInt(json['approved_id']);
    ownerId = PriceConverter.parseInt(json['owner_id']);
    ownerType = json['owner_type'];
    planCurrencyId = PriceConverter.parseInt(json['plan_currency_id']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['invoice_id'] = invoiceId;
    data['amount'] = amount;
    data['status'] = status;
    data['is_approved'] = isApproved;
    data['approved_id'] = approvedId;
    data['owner_id'] = ownerId;
    data['owner_type'] = ownerType;
    data['plan_currency_id'] = planCurrencyId;

    return data;
  }
}
