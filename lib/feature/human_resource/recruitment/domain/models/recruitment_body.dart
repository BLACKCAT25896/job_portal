class RecruitmentBody {
  String? title;
  String? departmentId;
  String? designationId;
  String? vacancyCount;
  String? description;
  String? requirements;
  String? startDate;
  String? endDate;
  String? jobType;
  String? recruiterId;
  String? status;
  String? method;

  RecruitmentBody(
      {this.title,
        this.departmentId,
        this.designationId,
        this.vacancyCount,
        this.description,
        this.requirements,
        this.startDate,
        this.endDate,
        this.jobType,
        this.recruiterId,
        this.status,
        this.method
      });

  RecruitmentBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    vacancyCount = json['vacancy_count'];
    description = json['description'];
    requirements = json['requirements'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    jobType = json['job_type'];
    recruiterId = json['recruiter_id'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['department_id'] = departmentId;
    data['designation_id'] = designationId;
    data['vacancy_count'] = vacancyCount;
    data['description'] = description;
    data['requirements'] = requirements;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['job_type'] = jobType;
    data['recruiter_id'] = recruiterId;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
