class FeedbackBody {
  String? name;
  String? description;
  String? videoUrl;
  String? rating;
  String? sMethod;

  FeedbackBody(
      {this.name, this.description, this.videoUrl, this.rating, this.sMethod});

  FeedbackBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    videoUrl = json['video_url'];
    rating = json['ratting'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['video_url'] = videoUrl;
    data['ratting'] = rating;
    data['_method'] = sMethod;
    return data;
  }
}
