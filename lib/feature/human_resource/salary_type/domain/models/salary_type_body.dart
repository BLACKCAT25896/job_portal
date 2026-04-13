class SalaryTypeBody {
  String? name;
  String? type;
  String? defaultAmount;
  String? calculationMethod;
  bool? isTaxable;
  bool? isVisibleInPayslip;
  int? status;
  String? method;


  SalaryTypeBody(
      {this.name,
        this.type,
        this.defaultAmount,
        this.calculationMethod,
        this.isTaxable,
        this.isVisibleInPayslip,
        this.status,
        this.method
      });

  SalaryTypeBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    defaultAmount = json['default_amount'];
    calculationMethod = json['calculation_method'];
    isTaxable = json['is_taxable'];
    isVisibleInPayslip = json['is_visible_in_payslip'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['default_amount'] = defaultAmount;
    data['calculation_method'] = calculationMethod;
    data['is_taxable'] = isTaxable;
    data['is_visible_in_payslip'] = isVisibleInPayslip;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
