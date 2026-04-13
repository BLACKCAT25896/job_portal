class WeeklyHolidayBody {
  String? day;
  String? description;
  int? status;

  WeeklyHolidayBody({this.day, this.description, this.status});

  WeeklyHolidayBody.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
