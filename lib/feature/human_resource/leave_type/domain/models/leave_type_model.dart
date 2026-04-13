

class LeaveTypeItem {
  String? id;
  String? name;
  String? maxDays;
  String? carryForward;
  String? isPaid;
  String? status;
  String? description;

  LeaveTypeItem(
      {this.id,
        this.name,
        this.maxDays,
        this.carryForward,
        this.isPaid,
        this.status,
        this.description,});

  LeaveTypeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    maxDays = json['max_days'].toString();
    carryForward = json['carry_forward'].toString();
    isPaid = json['is_paid'].toString();
    status = json['status'].toString();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['max_days'] = maxDays;
    data['carry_forward'] = carryForward;
    data['is_paid'] = isPaid;
    data['status'] = status;
    data['description'] = description;
    return data;
  }
}