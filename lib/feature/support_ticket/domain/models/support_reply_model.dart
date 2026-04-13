

import 'package:ecommerce/helper/price_converter.dart';

class ReplyItem {
  int? id;
  String? ticketId;
  String? message;
  List<String>? attachments;
  String? userType;
  String? status;
  String? createdAt;
  Ticket? ticket;
  int? userId;
  User? user;

  ReplyItem(
      {this.id,
        this.ticketId,
        this.message,
        this.attachments,
        this.userType,
        this.status,
        this.createdAt,
        this.ticket,
        this.userId,
        this.user
      });

  ReplyItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'].toString();
    message = json['message'];
    attachments = (json['attachments'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList()
        ?? [];

    userType = json['user_type'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
    ticket =
    json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
    userId = PriceConverter.parseInt(json['user_id']);
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ticket_id'] = ticketId;
    data['message'] = message;
    data['attachments'] = attachments;
    data['user_type'] = userType;
    data['status'] = status;
    data['created_at'] = createdAt;
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    data['user_id'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Ticket {
  int? id;
  String? userId;
  String? title;

  Ticket({this.id, this.userId, this.title});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'].toString();
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;

  User({this.id, this.firstName, this.lastName, this.userType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_type'] = userType;
    return data;
  }
}


