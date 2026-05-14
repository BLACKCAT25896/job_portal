

import 'package:job/helper/price_converter.dart';

class CandidateCertificateItem {
  int? id;
  String? title;
  String? institute;
  String? location;
  int? durationValue;
  String? durationType;
  String? issuedDate;

  CandidateCertificateItem(
      {this.id,
        this.title,
        this.institute,
        this.location,
        this.durationValue,
        this.durationType,
        this.issuedDate,
       });

  CandidateCertificateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    institute = json['institute'];
    location = json['location'];
    durationValue = PriceConverter.parseInt(json['duration_value']);
    durationType = json['duration_type'];
    issuedDate = json['issued_date'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['institute'] = institute;
    data['location'] = location;
    data['duration_value'] = durationValue;
    data['duration_type'] = durationType;
    data['issued_date'] = issuedDate;
    return data;
  }
}
