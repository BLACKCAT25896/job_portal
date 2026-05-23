

import 'package:job/helper/price_converter.dart';
class CandidateReferenceItem {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? designation;
  String? organization;
  String? address;
  String? relation;


  CandidateReferenceItem(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.designation,
        this.organization,
        this.relation,
        this.address,});

  CandidateReferenceItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    organization = json['organization'];
    designation = json['designation'];
    relation = json['relation'];
    address = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['mobile'] = mobile;
    data['organization'] = organization;
    data['designation'] = designation;
    data['relation'] = relation;
    return data;
  }
}