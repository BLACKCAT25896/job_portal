
import 'package:mighty_job/helper/price_converter.dart';

class PostCommentItem {
  int? id;
  int? postId;
  String? postTitle;
  int? userId;
  String? userFirstName;
  String? userLastName;
  String? name;
  String? email;
  String? comment;
  int? isApproved;
  int? isSpam;

  PostCommentItem(
      {this.id,
        this.postId,
        this.postTitle,
        this.userId,
        this.userFirstName,
        this.userLastName,
        this.name,
        this.email,
        this.comment,
        this.isApproved,
        this.isSpam,
      });

  PostCommentItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    postId = PriceConverter.parseInt(json['post_id']);
    postTitle = json['post_title'];
    userId = PriceConverter.parseInt(json['user_id']);
    userFirstName = json['user_first_name'];
    userLastName = json['user_last_name'];
    name = json['name'];
    email = json['email'];
    comment = json['comment'];
    isApproved = PriceConverter.parseInt(json['is_approved']);
    isSpam = PriceConverter.parseInt(json['is_spam']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['post_title'] = postTitle;
    data['user_id'] = userId;
    data['user_first_name'] = userFirstName;
    data['user_last_name'] = userLastName;
    data['name'] = name;
    data['email'] = email;
    data['comment'] = comment;
    data['is_approved'] = isApproved;
    data['is_spam'] = isSpam;
    return data;
  }
}
