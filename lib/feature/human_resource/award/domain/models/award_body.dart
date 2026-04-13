class AwardBody {
  int? employeeId;
  String? title;
  String? description;
  String? dateAwarded;
  String? amount;
  String? awardType;

  AwardBody(
      {this.employeeId,
        this.title,
        this.description,
        this.dateAwarded,
        this.amount,
        this.awardType,});

  AwardBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    title = json['title'];
    description = json['description'];
    dateAwarded = json['date_awarded'];
    amount = json['amount'];
    awardType = json['award_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['title'] = title;
    data['description'] = description;
    data['date_awarded'] = dateAwarded;
    data['amount'] = amount;
    data['award_type'] = awardType;
    return data;
  }
}
