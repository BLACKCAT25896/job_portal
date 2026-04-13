
import 'package:ecommerce/helper/price_converter.dart';



class InterviewItem {
  int? id;
  int? candidateId;
  String? candidateFirstName;
  String? candidateLastName;
  String? recruitmentTitle;
  int? departmentId;
  String? departmentName;
  String? interviewDate;
  String? interviewerName;
  String? feedback;
  int? rating;
  String? status;

  InterviewItem(
      {this.id,
        this.candidateId,
        this.candidateFirstName,
        this.candidateLastName,
        this.recruitmentTitle,
        this.departmentId,
        this.departmentName,
        this.interviewDate,
        this.interviewerName,
        this.feedback,
        this.rating,
        this.status,});

  InterviewItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = PriceConverter.parseInt(json['candidate_id']);
    candidateFirstName = json['candidate_first_name'];
    candidateLastName = json['candidate_last_name'];
    recruitmentTitle = json['recruitment_title'];
    departmentId = PriceConverter.parseInt(json['department_id']);
    departmentName = json['department_name'];
    interviewDate = json['interview_date'];
    interviewerName = json['interviewer_name'];
    feedback = json['feedback'];
    rating = PriceConverter.parseInt(json['rating']);
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['candidate_first_name'] = candidateFirstName;
    data['candidate_last_name'] = candidateLastName;
    data['recruitment_title'] = recruitmentTitle;
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['interview_date'] = interviewDate;
    data['interviewer_name'] = interviewerName;
    data['feedback'] = feedback;
    data['rating'] = rating;
    data['status'] = status;
    return data;
  }
}
