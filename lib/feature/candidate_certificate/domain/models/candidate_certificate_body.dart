class CandidateCertificateBody {
  String? title;
  String? institute;
  String? location;
  String? durationValue;
  String? durationType;
  String? issuedDate;
  int? status;
  String? sMethod;

  CandidateCertificateBody(
      {this.title,
        this.institute,
        this.location,
        this.durationValue,
        this.durationType,
        this.issuedDate,
        this.status,
        this.sMethod});

  CandidateCertificateBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    institute = json['institute'];
    location = json['location'];
    durationValue = json['duration_value'];
    durationType = json['duration_type'];
    issuedDate = json['issued_date'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['institute'] = institute;
    data['location'] = location;
    data['duration_value'] = durationValue;
    data['duration_type'] = durationType;
    data['issued_date'] = issuedDate;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
