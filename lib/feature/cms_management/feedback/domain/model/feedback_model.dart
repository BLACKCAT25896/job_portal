

import 'package:mighty_job/helper/price_converter.dart';

class FeedbackItem {
  int? id;
  String? name;
  String? description;
  String? thumbnailImage;
  String? videoUrl;
  int? status;

  FeedbackItem(
      {this.id,
        this.name,
        this.description,
        this.thumbnailImage,
        this.videoUrl,
        this.status,});

  FeedbackItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    description = json['description'];
    thumbnailImage = json['thumbnail_image'];
    videoUrl = json['video_url'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail_image'] = thumbnailImage;
    data['video_url'] = videoUrl;
    data['status'] = status;
    return data;
  }
}


