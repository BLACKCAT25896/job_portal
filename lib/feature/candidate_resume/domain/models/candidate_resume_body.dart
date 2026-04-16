class CandidateResumeBody {
  int? candidateId;
  String? title;
  String? type;
  int? isDefault;
  int? status;
  String? sMethod;

  CandidateResumeBody(
      {this.candidateId,
        this.title,
        this.type,
        this.isDefault,
        this.status,
        this.sMethod});

  CandidateResumeBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    title = json['title'];
    type = json['type'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['title'] = title;
    data['type'] = type;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
