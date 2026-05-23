class CandidateReferenceBody {
  String? name;
  String? designation;
  String? organization;
  String? relation;
  String? email;
  String? mobile;
  String? phoneOffice;
  String? phoneResidential;
  String? address;
  int? status;
  String? sMethod;

  CandidateReferenceBody(
      {this.name,
        this.designation,
        this.organization,
        this.relation,
        this.email,
        this.mobile,
        this.phoneOffice,
        this.phoneResidential,
        this.address,
        this.status,
        this.sMethod});

  CandidateReferenceBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    organization = json['organization'];
    relation = json['relation'];
    email = json['email'];
    mobile = json['mobile'];
    phoneOffice = json['phone_office'];
    phoneResidential = json['phone_residential'];
    address = json['address'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['organization'] = organization;
    data['relation'] = relation;
    data['email'] = email;
    data['mobile'] = mobile;
    data['phone_office'] = phoneOffice;
    data['phone_residential'] = phoneResidential;
    data['address'] = address;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
