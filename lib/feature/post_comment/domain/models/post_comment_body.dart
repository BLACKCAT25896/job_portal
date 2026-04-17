class PostCommentBody {
  int? postId;
  String? name;
  String? email;
  String? comment;
  int? parentId;

  PostCommentBody(
      {this.postId, this.name, this.email, this.comment, this.parentId});

  PostCommentBody.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['name'] = name;
    data['email'] = email;
    data['comment'] = comment;
    data['parent_id'] = parentId;
    return data;
  }
}
