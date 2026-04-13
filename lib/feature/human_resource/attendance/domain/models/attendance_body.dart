class AttendanceBody {
  int? employeeId;
  String? date;
  String? clockIn;
  String? clockOut;
  double? hoursWorked;
  String? status;

  AttendanceBody(
      {this.employeeId,
        this.date,
        this.clockIn,
        this.clockOut,
        this.hoursWorked,
        this.status});

  AttendanceBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    date = json['date'];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
    hoursWorked = json['hours_worked'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['date'] = date;
    data['clock_in'] = clockIn;
    data['clock_out'] = clockOut;
    data['hours_worked'] = hoursWorked;
    data['status'] = status;
    return data;
  }
}
