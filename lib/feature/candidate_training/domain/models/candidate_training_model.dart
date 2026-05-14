

import 'package:job/helper/price_converter.dart';

class CandidateTrainingItem {
  int? id;
  String? title;
  String? topicsCovered;
  String? trainingYear;
  String? institute;
  int? durationValue;
  String? durationType;
  String? location;
  String? description;

  CandidateTrainingItem(
      {this.id,
        this.title,
        this.topicsCovered,
        this.trainingYear,
        this.institute,
        this.durationValue,
        this.durationType,
        this.location,
        this.description,
       });

  CandidateTrainingItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    title = json['title'];
    topicsCovered = json['topics_covered'];
    trainingYear = json['training_year'];
    institute = json['institute'];
    durationValue = PriceConverter.parseInt(json['duration_value']);
    durationType = json['duration_type'];
    location = json['location'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['topics_covered'] = topicsCovered;
    data['training_year'] = trainingYear;
    data['institute'] = institute;
    data['duration_value'] = durationValue;
    data['duration_type'] = durationType;
    data['location'] = location;
    data['description'] = description;
    return data;
  }
}