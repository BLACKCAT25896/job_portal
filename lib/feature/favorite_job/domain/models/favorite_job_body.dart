class FavoriteJobBody {
  int? candidateId;
  int? jobListingId;

  FavoriteJobBody({this.candidateId, this.jobListingId});

  FavoriteJobBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    jobListingId = json['job_listing_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['job_listing_id'] = jobListingId;
    return data;
  }
}
