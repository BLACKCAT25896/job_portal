


import 'package:ecommerce/helper/price_converter.dart';

class RecruitmentItem {
  int? id;
  String? title;
  String? description;
  String? requirements;
  int? vacancyCount;
  int? departmentId;
  String? departmentName;
  int? designationId;
  String? designationTitle;
  String? startDate;
  String? endDate;
  String? jobType;
  int? recruiterId;
  String? recruiterFirstName;
  String? recruiterLastName;
  String? status;
  String? createdAt;

  RecruitmentItem(
      {this.id,
        this.title,
        this.description,
        this.requirements,
        this.vacancyCount,
        this.departmentId,
        this.departmentName,
        this.designationId,
        this.designationTitle,
        this.startDate,
        this.endDate,
        this.jobType,
        this.recruiterId,
        this.recruiterFirstName,
        this.recruiterLastName,
        this.status,
        this.createdAt});

  RecruitmentItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    title = json['title'];
    description = json['description'];
    requirements = json['requirements'];
    vacancyCount = PriceConverter.parseInt(json['vacancy_count']);
    departmentId = PriceConverter.parseInt(json['department_id']);
    departmentName = json['department_name'];
    designationId = PriceConverter.parseInt(json['designation_id']);
    designationTitle = json['designation_title'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    jobType = json['job_type'].toString();
    recruiterId = PriceConverter.parseInt(json['recruiter_id']);
    recruiterFirstName = json['recruiter_first_name'];
    recruiterLastName = json['recruiter_last_name'];
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['requirements'] = requirements;
    data['vacancy_count'] = vacancyCount;
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['designation_id'] = designationId;
    data['designation_title'] = designationTitle;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['job_type'] = jobType;
    data['recruiter_id'] = recruiterId;
    data['recruiter_first_name'] = recruiterFirstName;
    data['recruiter_last_name'] = recruiterLastName;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

