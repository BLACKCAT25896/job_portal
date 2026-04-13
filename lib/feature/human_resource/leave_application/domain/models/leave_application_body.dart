class LeaveApplicationBody {
  int? employeeId;
  int? leaveTypeId;
  String? startDate;
  String? endDate;
  String? reason;
  String? adminNote;
  String? status;
  String? leaveDurationType;
  String? method;

  LeaveApplicationBody(
      {this.employeeId,
        this.leaveTypeId,
        this.startDate,
        this.endDate,
        this.reason,
        this.adminNote,
        this.status,
        this.leaveDurationType,
        this.method
      });

  LeaveApplicationBody.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    leaveTypeId = json['leave_type_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    adminNote = json['admin_note'];
    status = json['status'];
    leaveDurationType = json['leave_duration_type'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['leave_type_id'] = leaveTypeId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['reason'] = reason;
    data['admin_note'] = adminNote;
    data['status'] = status;
    data['leave_duration_type'] = leaveDurationType;
    data['_method'] = method;
    return data;
  }
}
