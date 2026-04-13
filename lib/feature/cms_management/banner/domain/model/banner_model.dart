
class BannerItem {
  String? id;
  String? title;
  String? description;
  String? buttonName;
  String? buttonLink;
  String? image;
  String? status;
  String? createdAt;

  BannerItem(
      {this.id,
        this.title,
        this.description,
        this.buttonName,
        this.buttonLink,
        this.image,
        this.status,
        this.createdAt});

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    description = json['description'];
    buttonName = json['button_name'];
    buttonLink = json['button_link'];
    image = json['image'];
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['button_name'] = buttonName;
    data['button_link'] = buttonLink;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

