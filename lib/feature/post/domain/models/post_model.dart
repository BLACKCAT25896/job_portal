

import 'package:mighty_job/helper/price_converter.dart';

class PostItem {
  int? id;
  String? title;
  String? slug;
  String? description;
  int? postCategoryId;
  String? metaTitle;
  String? metaDescription;
  String? featuredImage;
  bool? isFeatured;
  bool? isDefault;
  bool? status;
  String? publishedAt;
  int? views;
  String? createdAt;
  Category? category;
  Author? author;

  PostItem(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.postCategoryId,
        this.metaTitle,
        this.metaDescription,
        this.featuredImage,
        this.isFeatured,
        this.isDefault,
        this.status,
        this.publishedAt,
        this.views,
        this.createdAt,
        this.category,
        this.author,
       });

  PostItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    postCategoryId = PriceConverter.parseInt(json['post_category_id']);
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    featuredImage = json['featured_image'];
    isFeatured = json['is_featured'];
    isDefault = json['is_default'];
    status = json['status'];
    publishedAt = json['published_at'];
    views = PriceConverter.parseInt(json['views']);
    createdAt = json['created_at'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    author =
    json['author'] != null ? Author.fromJson(json['author']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['post_category_id'] = postCategoryId;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['featured_image'] = featuredImage;
    data['is_featured'] = isFeatured;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['published_at'] = publishedAt;
    data['views'] = views;
    data['created_at'] = createdAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Author {
  int? id;
  String? firstName;
  String? lastName;

  Author({this.id, this.firstName, this.lastName});

  Author.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}

