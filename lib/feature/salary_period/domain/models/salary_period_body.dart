class SalaryPeriodBody {
  String? period;
  String? description;
  bool? isDefault;
  bool? status;
  String? sMethod;

  SalaryPeriodBody(
      {this.period,
        this.description,
        this.isDefault,
        this.status,
        this.sMethod});

  SalaryPeriodBody.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    description = json['description'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['period'] = period;
    data['description'] = description;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
