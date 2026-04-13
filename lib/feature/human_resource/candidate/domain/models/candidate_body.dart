class CandidateBody {
  int? recruitmentId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? status;
  String? notes;
  String? method;

  CandidateBody(
      {this.recruitmentId,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.status,
        this.notes,
        this.method
      });

  CandidateBody.fromJson(Map<String, dynamic> json) {
    recruitmentId = json['recruitment_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    notes = json['notes'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recruitment_id'] = recruitmentId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['notes'] = notes;
    data['_method'] = method;
    return data;
  }
}
