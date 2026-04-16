
class FavoriteJobItem {
  int? id;
  int? candidateId;
  String? candidateFirstName;
  String? candidateLastName;
  int? jobListingId;
  String? jobTitle;

  FavoriteJobItem(
      {this.id,
        this.candidateId,
        this.candidateFirstName,
        this.candidateLastName,
        this.jobListingId,
        this.jobTitle,
        });

  FavoriteJobItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    candidateFirstName = json['candidate_first_name'];
    candidateLastName = json['candidate_last_name'];
    jobListingId = json['job_listing_id'];
    jobTitle = json['job_title'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['candidate_first_name'] = candidateFirstName;
    data['candidate_last_name'] = candidateLastName;
    data['job_listing_id'] = jobListingId;
    data['job_title'] = jobTitle;

    return data;
  }
}
