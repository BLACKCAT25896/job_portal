

import 'package:mighty_job/helper/price_converter.dart';

class SupportTicketItem {
  int? id;
  String? mighty_jobId;
  String? readableTicketId;
  String? userId;
  String? categoryId;
  String? title;
  String? description;
  String? purchaseCode;
  String? read;
  String? supportPlan;
  List<String>? attachments;
  String? lastConversationTime;
  String? status;
  String? createdAt;
  User? user;
  Category? category;
  Category? mighty_job;
  String? lastTicketConversation;
  List<Conversations>? conversations;

  SupportTicketItem(
      {this.id,
        this.mighty_jobId,
        this.readableTicketId,
        this.userId,
        this.categoryId,
        this.title,
        this.description,
        this.purchaseCode,
        this.read,
        this.supportPlan,
        this.attachments,
        this.lastConversationTime,
        this.status,
        this.createdAt,
        this.user,
        this.category,
        this.mighty_job,
        this.lastTicketConversation,
        this.conversations});

  SupportTicketItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    mighty_jobId = json['mighty_job_id'].toString();
    readableTicketId = json['readable_ticket_id'].toString();
    userId = json['user_id'].toString();
    categoryId = json['category_id'].toString();
    title = json['title'];
    description = json['description'];
    purchaseCode = json['purchase_code'];
    read = json['read'].toString();
    supportPlan = json['support_plan'];
    attachments = (json['attachments'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList()
        ?? [];

    lastConversationTime = json['last_conversation_time'];
    status = json['status'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    mighty_job = json['mighty_job'] != null
        ? Category.fromJson(json['mighty_job'])
        : null;
    lastTicketConversation = json['last_ticket_conversation'];
    if (json['conversations'] != null) {
      conversations = <Conversations>[];
      json['conversations'].forEach((v) {
        conversations!.add(Conversations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mighty_job_id'] = mighty_jobId;
    data['readable_ticket_id'] = readableTicketId;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['description'] = description;
    data['purchase_code'] = purchaseCode;
    data['read'] = read;
    data['support_plan'] = supportPlan;
    data['attachments'] = attachments;
    data['last_conversation_time'] = lastConversationTime;
    data['status'] = status;
    data['created_at'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (mighty_job != null) {
      data['mighty_job'] = mighty_job!.toJson();
    }
    data['last_ticket_conversation'] = lastTicketConversation;
    if (conversations != null) {
      data['conversations'] =
          conversations!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Conversations {
  int? id;
  String? ticketId;
  String? message;
  String? userType;
  String? status;
  String? createdAt;

  Conversations(
      {this.id,
        this.ticketId,
        this.message,
        this.userType,
        this.status,
        this.createdAt,});

  Conversations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'].toString();
    message = json['message'];
    userType = json['user_type'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ticket_id'] = ticketId;
    data['message'] = message;
    data['user_type'] = userType;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

