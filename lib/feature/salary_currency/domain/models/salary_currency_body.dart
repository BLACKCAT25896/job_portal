class SalaryCurrencyBody {
  String? currencyName;
  String? currencyCode;
  String? currencyIcon;
  bool? isDefault;
  int? status;
  String? sMethod;

  SalaryCurrencyBody(
      {this.currencyName,
        this.currencyCode,
        this.currencyIcon,
        this.isDefault,
        this.status,
        this.sMethod});

  SalaryCurrencyBody.fromJson(Map<String, dynamic> json) {
    currencyName = json['currency_name'];
    currencyCode = json['currency_code'];
    currencyIcon = json['currency_icon'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency_name'] = currencyName;
    data['currency_code'] = currencyCode;
    data['currency_icon'] = currencyIcon;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
