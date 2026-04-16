

import 'package:mighty_job/helper/price_converter.dart';

class CandidateEducationItem {
  int? id;
  int? candidateId;
  int? degreeLevelId;
  String? degreeTitle;
  String? institute;
  String? result;
  int? year;
  int? isVerified;
  int? status;

  CandidateEducationItem(
      {this.id,
        this.candidateId,
        this.degreeLevelId,
        this.degreeTitle,
        this.institute,
        this.result,
        this.year,
        this.isVerified,
        this.status,
       });

  CandidateEducationItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    candidateId = PriceConverter.parseInt(json['candidate_id']);
    degreeLevelId = PriceConverter.parseInt(json['degree_level_id']);
    degreeTitle = json['degree_title'];
    institute = json['institute'];
    result = json['result'];
    year = PriceConverter.parseInt(json['year']);
    isVerified = PriceConverter.parseInt(json['is_verified']);
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['degree_level_id'] = degreeLevelId;
    data['degree_title'] = degreeTitle;
    data['institute'] = institute;
    data['result'] = result;
    data['year'] = year;
    data['is_verified'] = isVerified;
    data['status'] = status;
    return data;
  }
}
