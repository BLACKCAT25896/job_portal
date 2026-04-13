class InterviewBody {
  int? candidateId;
  int? departmentId;
  String? interviewDate;
  String? interviewerName;
  String? feedback;
  String? rating;
  String? status;

  InterviewBody(
      {this.candidateId,
        this.departmentId,
        this.interviewDate,
        this.interviewerName,
        this.feedback,
        this.rating,
        this.status});

  InterviewBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    departmentId = json['department_id'];
    interviewDate = json['interview_date'];
    interviewerName = json['interviewer_name'];
    feedback = json['feedback'];
    rating = json['rating'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['department_id'] = departmentId;
    data['interview_date'] = interviewDate;
    data['interviewer_name'] = interviewerName;
    data['feedback'] = feedback;
    data['rating'] = rating;
    data['status'] = status;
    return data;
  }
}
