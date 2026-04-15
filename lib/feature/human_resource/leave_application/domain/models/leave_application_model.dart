

class LeaveApplicationItem {
  String? id;
  String? mighty_jobName;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationTitle;
  String? leaveTypeName;
  String? startDate;
  String? endDate;
  String? reason;
  String? adminNote;
  String? approvedBy;
  String? approvedByName;
  String? leaveDurationType;
  String? status;
  String? createdAt;

  LeaveApplicationItem(
      {this.id,
        this.mighty_jobName,
        this.firstName,
        this.lastName,
        this.departmentName,
        this.designationTitle,
        this.leaveTypeName,
        this.startDate,
        this.endDate,
        this.reason,
        this.adminNote,
        this.approvedBy,
        this.approvedByName,
        this.leaveDurationType,
        this.status,
        this.createdAt});

  LeaveApplicationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    mighty_jobName = json['mighty_job_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    departmentName = json['department_name'];
    designationTitle = json['designation_title'];
    leaveTypeName = json['leave_type_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    adminNote = json['admin_note'];
    approvedBy = json['approved_by'].toString();
    approvedByName = json['approved_by_name'];
    leaveDurationType = json['leave_duration_type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mighty_job_name'] = mighty_jobName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['department_name'] = departmentName;
    data['designation_title'] = designationTitle;
    data['leave_type_name'] = leaveTypeName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['reason'] = reason;
    data['admin_note'] = adminNote;
    data['approved_by'] = approvedBy;
    data['approved_by_name'] = approvedByName;
    data['leave_duration_type'] = leaveDurationType;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
