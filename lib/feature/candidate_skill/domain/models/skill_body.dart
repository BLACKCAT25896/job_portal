class CandidateSkillBody {
  int? skillId;
  String? method;

  CandidateSkillBody({ this.skillId, this.method});

  CandidateSkillBody.fromJson(Map<String, dynamic> json) {
    skillId = json['skill_id'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill_id'] = skillId;
    data['_method'] = method;
    return data;
  }
}
