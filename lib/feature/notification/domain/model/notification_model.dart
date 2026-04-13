class NotificationModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;
  Metadata? metadata;


  NotificationModel(
      {this.success, this.statusCode, this.message, this.data, this.metadata});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
  }
  //toJson
  Map<String, dynamic> toJson() {
    return {
      if (success!= null) 'success': success,
      if (statusCode!= null) 'status_code': statusCode,
      if (message!= null) 'message': message,
      if (data!= null) 'data': data?.toJson(),
      if (metadata!= null) 'metadata': metadata?.toJson(),
    };
  }

}

class Data {
  int? currentPage;
  List<NotificationItem>? data;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <NotificationItem>[];
      json['data'].forEach((v) {
        data!.add(NotificationItem.fromJson(v));
      });
    }
    total = json['total'];
  }
  //toJson
  Map<String, dynamic> toJson() {
    return {
      if (currentPage!= null) 'current_page': currentPage,
      if (data!= null) 'data': data?.map((e) => e.toJson()).toList(),
      if (total!= null) 'total': total,
    };
  }
}

class NotificationItem {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotificationData? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationItem(
      {this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      if (id!= null) 'id': id,
      if (type!= null) 'type': type,
      if (notifiableType!= null) 'notifiable_type': notifiableType,
      if (notifiableId!= null) 'notifiable_id': notifiableId,
      if (data!= null) 'data': data?.toJson(),
      if (readAt!= null) 'read_at': readAt,
      if (createdAt!= null) 'created_at': createdAt,
      if (updatedAt!= null) 'updated_at': updatedAt,
    };
  }

}

class NotificationData {
  String? message;
  int? saleId;
  String? amount;

  NotificationData({this.message, this.saleId, this.amount});

  NotificationData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    saleId = json['sale_id'];
    amount = json['amount'].toString();
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      if (message!= null) 'message': message,
      if (saleId!= null) 'sale_id': saleId,
      if (amount!= null) 'amount': amount,
    };
  }

}
class Metadata {
  int? unreadNotifications;

  Metadata({this.unreadNotifications});

  Metadata.fromJson(Map<String, dynamic> json) {
    unreadNotifications = json['unread_notifications'];
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      if (unreadNotifications!= null) 'unread_notifications': unreadNotifications,
    };
  }

}

