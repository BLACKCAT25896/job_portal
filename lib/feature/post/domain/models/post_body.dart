class PostBody {
  String? title;
  String? slug;
  String? description;
  int? postCategoryId;
  int? createdBy;
  String? metaTitle;
  String? metaDescription;
  String? featuredImage;
  bool? isFeatured;
  bool? isDefault;
  bool? status;
  String? publishedAt;
  int? views;
  String? sMethod;

  PostBody(
      {this.title,
        this.slug,
        this.description,
        this.postCategoryId,
        this.createdBy,
        this.metaTitle,
        this.metaDescription,
        this.featuredImage,
        this.isFeatured,
        this.isDefault,
        this.status,
        this.publishedAt,
        this.views,
        this.sMethod});

  PostBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    postCategoryId = json['post_category_id'];
    createdBy = json['created_by'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    featuredImage = json['featured_image'];
    isFeatured = json['is_featured'];
    isDefault = json['is_default'];
    status = json['status'];
    publishedAt = json['published_at'];
    views = json['views'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['post_category_id'] = postCategoryId;
    data['created_by'] = createdBy;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['featured_image'] = featuredImage;
    data['is_featured'] = isFeatured;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['published_at'] = publishedAt;
    data['views'] = views;
    data['_method'] = sMethod;
    return data;
  }
}
