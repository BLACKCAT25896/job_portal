

import 'package:job/helper/price_converter.dart';
class CandidateReferenceItem {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? position;
  String? company;
  String? address;

  CandidateReferenceItem(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.position,
        this.company,
        this.address,});

  CandidateReferenceItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    position = json['position'];
    company = json['company'];
    address = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['position'] = position;
    data['company'] = company;
    data['address'] = address;
    return data;
  }
}