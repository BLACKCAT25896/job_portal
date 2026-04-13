class LeaveTypeBody {
  String? name;
  int? maxDays;
  bool? carryForward;
  bool? isPaid;
  int? status;
  String? description;
  String? method;

  LeaveTypeBody(
      {this.name,
        this.maxDays,
        this.carryForward,
        this.isPaid,
        this.status,
        this.description,
        this.method
      });

  LeaveTypeBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    maxDays = json['max_days'];
    carryForward = json['carry_forward'];
    isPaid = json['is_paid'];
    status = json['status'];
    description = json['description'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['max_days'] = maxDays;
    data['carry_forward'] = carryForward;
    data['is_paid'] = isPaid;
    data['status'] = status;
    data['description'] = description;
    data['_method'] = method;
    return data;
  }
}
