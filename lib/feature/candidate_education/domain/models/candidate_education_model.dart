

import 'package:job/helper/price_converter.dart';

class CandidateEducationItem {
  int? id;
  String? degreeTitle;
  String? major;
  String? board;
  String? institute;
  String? result;
  String? cgpa;
  String? scale;
  String? passingYear;
  int? durationYears;
  String? achievement;
  int? isVerified;
  int? status;

  CandidateEducationItem(
      {this.id,
        this.degreeTitle,
        this.major,
        this.board,
        this.institute,
        this.result,
        this.cgpa,
        this.scale,
        this.passingYear,
        this.durationYears,
        this.achievement,
        this.isVerified,
        this.status,
       });

  CandidateEducationItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    degreeTitle = json['degree_title'];
    major = json['major'];
    board = json['board'];
    institute = json['institute'];
    result = json['result'];
    cgpa = json['cgpa'];
    scale = json['scale'];
    passingYear = json['passing_year'];
    durationYears = PriceConverter.parseInt(json['duration_years']);
    achievement = json['achievement'];
    isVerified = PriceConverter.parseInt(json['is_verified']);
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degree_title'] = degreeTitle;
    data['major'] = major;
    data['board'] = board;
    data['institute'] = institute;
    data['result'] = result;
    data['cgpa'] = cgpa;
    data['scale'] = scale;
    data['passing_year'] = passingYear;
    data['duration_years'] = durationYears;
    data['achievement'] = achievement;
    data['is_verified'] = isVerified;
    data['status'] = status;
    return data;
  }
}