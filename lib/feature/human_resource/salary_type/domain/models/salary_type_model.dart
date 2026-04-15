

import 'package:mighty_job/helper/price_converter.dart';

class SalaryTypeItem {
  String? id;
  String? name;
  String? type;
  double? defaultAmount;
  String? calculationMethod;
  String? isTaxable;
  String? isVisibleInPayslip;
  String? status;

  SalaryTypeItem(
      {this.id,
        this.name,
        this.type,
        this.defaultAmount,
        this.calculationMethod,
        this.isTaxable,
        this.isVisibleInPayslip,
        this.status,});

  SalaryTypeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    type = json['type'].toString();
    defaultAmount = PriceConverter.parseAmount(json['default_amount']);
    calculationMethod = json['calculation_method'];
    isTaxable = json['is_taxable'].toString();
    isVisibleInPayslip = json['is_visible_in_payslip'].toString();
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['default_amount'] = defaultAmount;
    data['calculation_method'] = calculationMethod;
    data['is_taxable'] = isTaxable;
    data['is_visible_in_payslip'] = isVisibleInPayslip;
    data['status'] = status;
    return data;
  }
}


