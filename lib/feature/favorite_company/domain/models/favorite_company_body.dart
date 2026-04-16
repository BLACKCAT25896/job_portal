class FavoriteCompanyBody {
  int? candidateId;
  int? companyId;

  FavoriteCompanyBody({this.candidateId, this.companyId});

  FavoriteCompanyBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['company_id'] = companyId;
    return data;
  }
}
