
class FavoriteCompanyItem {
  int? id;
  int? candidateId;
  String? candidateFirstName;
  String? candidateLastName;
  int? companyId;
  String? companyName;


  FavoriteCompanyItem(
      {this.id,
        this.candidateId,
        this.candidateFirstName,
        this.candidateLastName,
        this.companyId,
        this.companyName,
       });

  FavoriteCompanyItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    candidateFirstName = json['candidate_first_name'];
    candidateLastName = json['candidate_last_name'];
    companyId = json['company_id'];
    companyName = json['company_name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['candidate_first_name'] = candidateFirstName;
    data['candidate_last_name'] = candidateLastName;
    data['company_id'] = companyId;
    data['company_name'] = companyName;

    return data;
  }
}
