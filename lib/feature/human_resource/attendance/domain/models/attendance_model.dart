import 'package:ecommerce/helper/price_converter.dart';

class AttendanceItem {
  int? id;
  String? date;
  String? firstClockIn;
  String? lastClockOut;
  String? hoursWorked;
  String? status;
  Employee? employee;
  List<Logs>? logs;

  AttendanceItem(
      {this.id,
        this.date,
        this.firstClockIn,
        this.lastClockOut,
        this.hoursWorked,
        this.status,
        this.employee,
        this.logs});

  AttendanceItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    date = json['date'];
    firstClockIn = json['first_clock_in'];
    lastClockOut = json['last_clock_out'];
    hoursWorked = json['hours_worked'];
    status = json['status'].toString();
    employee = json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    if (json['logs'] != null) {
      logs = <Logs>[];
      json['logs'].forEach((v) {
        logs!.add(Logs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['first_clock_in'] = firstClockIn;
    data['last_clock_out'] = lastClockOut;
    data['hours_worked'] = hoursWorked;
    data['status'] = status;
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    if (logs != null) {
      data['logs'] = logs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  int? id;
  String? firstName;
  String? lastName;

  Employee(
      {this.id,
        this.firstName,
        this.lastName});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}

class Logs {
  int? id;
  String? type;
  String? punchTime;
  String? deviceId;

  Logs(
      {this.id,
        this.type,
        this.punchTime,
        this.deviceId,});

  Logs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    punchTime = json['punch_time'];
    deviceId = json['device_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['punch_time'] = punchTime;
    data['device_id'] = deviceId;
    return data;
  }
}