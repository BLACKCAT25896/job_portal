class CandidateEducationBody {
  int? candidateId;
  int? degreeLevelId;
  String? degreeTitle;
  String? institute;
  String? result;
  int? year;
  int? isVerified;
  int? status;
  String? sMethod;

  CandidateEducationBody(
      {this.candidateId,
        this.degreeLevelId,
        this.degreeTitle,
        this.institute,
        this.result,
        this.year,
        this.isVerified,
        this.status,
        this.sMethod});

  CandidateEducationBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    degreeLevelId = json['degree_level_id'];
    degreeTitle = json['degree_title'];
    institute = json['institute'];
    result = json['result'];
    year = json['year'];
    isVerified = json['is_verified'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['degree_level_id'] = degreeLevelId;
    data['degree_title'] = degreeTitle;
    data['institute'] = institute;
    data['result'] = result;
    data['year'] = year;
    data['is_verified'] = isVerified;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
