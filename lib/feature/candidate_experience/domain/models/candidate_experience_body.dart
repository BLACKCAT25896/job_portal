class CandidateExperienceBody {
  int? candidateId;
  String? experienceTitle;
  String? company;
  String? description;
  String? startDate;
  String? endDate;
  int? currentlyWorking;
  int? status;
  String? sMethod;

  CandidateExperienceBody(
      {this.candidateId,
        this.experienceTitle,
        this.company,
        this.description,
        this.startDate,
        this.endDate,
        this.currentlyWorking,
        this.status,
        this.sMethod});

  CandidateExperienceBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    experienceTitle = json['experience_title'];
    company = json['company'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    currentlyWorking = json['currently_working'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['experience_title'] = experienceTitle;
    data['company'] = company;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['currently_working'] = currentlyWorking;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
