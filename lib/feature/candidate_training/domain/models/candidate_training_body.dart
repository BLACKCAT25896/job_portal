class CandidateTrainingBody {
  String? title;
  List<String>? topicsCovered;
  String? trainingYear;
  String? institute;
  String? durationValue;
  String? durationType;
  String? location;
  String? description;
  int? status;
  String? sMethod;

  CandidateTrainingBody(
      {
        this.title,
        this.topicsCovered,
        this.trainingYear,
        this.institute,
        this.durationValue,
        this.durationType,
        this.location,
        this.description,
        this.status,
        this.sMethod});

  CandidateTrainingBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    topicsCovered = json['topics_covered'].cast<String>();
    trainingYear = json['training_year'];
    institute = json['institute'];
    durationValue = json['duration_value'];
    durationType = json['duration_type'];
    location = json['location'];
    description = json['description'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['topics_covered'] = topicsCovered;
    data['training_year'] = trainingYear;
    data['institute'] = institute;
    data['duration_value'] = durationValue;
    data['duration_type'] = durationType;
    data['location'] = location;
    data['description'] = description;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
