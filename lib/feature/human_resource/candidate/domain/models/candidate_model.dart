import 'package:ecommerce/helper/price_converter.dart';

class CandidateItem {
  String? id;
  int? recruitmentId;
  String? recruitmentTitle;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? resume;
  String? coverLetter;
  String? status;
  String? notes;

  CandidateItem(
      {this.id,
        this.recruitmentId,
        this.recruitmentTitle,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.resume,
        this.coverLetter,
        this.status,
        this.notes,});

  CandidateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    recruitmentId = PriceConverter.parseInt(json['recruitment_id']);
    recruitmentTitle = json['recruitment_title'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    status = json['status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recruitment_id'] = recruitmentId;
    data['recruitment_title'] = recruitmentTitle;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['status'] = status;
    data['notes'] = notes;
    return data;
  }
}