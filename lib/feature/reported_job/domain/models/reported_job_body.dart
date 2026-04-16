class ReportedJobBody {
  int? candidateId;
  int? jobListingId;
  String? note;
  String? sMethod;

  ReportedJobBody(
      {this.candidateId, this.jobListingId, this.note, this.sMethod});

  ReportedJobBody.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    jobListingId = json['job_listing_id'];
    note = json['note'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['job_listing_id'] = jobListingId;
    data['note'] = note;
    data['_method'] = sMethod;
    return data;
  }
}
