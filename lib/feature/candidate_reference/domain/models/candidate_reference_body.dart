class CandidateReferenceBody {
  String? name;
  String? phone;
  String? email;
  String? position;
  String? company;
  String? address;
  int? status;
  String? sMethod;

  CandidateReferenceBody(
      {this.name,
        this.phone,
        this.email,
        this.position,
        this.company,
        this.address,
        this.status,
        this.sMethod});

  CandidateReferenceBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    position = json['position'];
    company = json['company'];
    address = json['address'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['position'] = position;
    data['company'] = company;
    data['address'] = address;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
