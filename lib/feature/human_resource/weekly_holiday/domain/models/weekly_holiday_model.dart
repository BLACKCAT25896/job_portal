
class WeeklyHolidayItem {
  String? id;
  String? day;
  String? description;
  String? status;

  WeeklyHolidayItem(
      {this.id,
        this.day,
        this.description,
        this.status,});

  WeeklyHolidayItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    day = json['day'].toString();
    description = json['description'];
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}