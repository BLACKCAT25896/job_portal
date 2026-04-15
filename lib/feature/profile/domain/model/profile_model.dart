import 'package:mighty_job/helper/price_converter.dart';

class ProfileModel {
  bool? success;
  String? message;
  ProfileItem? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProfileItem.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileItem {
  int? id;
  String? name;
  String? username;
  String? phone;
  String? email;
  String? role;
  Subscription? subscription;
  String? image;
  Shop? shop;
  List<String>? permissions;

  ProfileItem(
      {this.id,
        this.name,
        this.username,
        this.phone,
        this.email,
        this.role,
        this.subscription,
        this.image,
        this.shop,
        this.permissions
      });

  ProfileItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    subscription = json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null;
    image = json['image'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    permissions = json['permissions'] != null ? List<String>.from(json['permissions']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['phone'] = phone;
    data['email'] = email;
    data['role'] = role;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    data['image'] = image;
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    data['permissions'] = permissions;
    return data;
  }
}

class Shop {
  int? id;
  String? name;

  Shop({this.id, this.name});

  Shop.fromJson(Map<String, dynamic> json) {
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

class Subscription {
  String? startDate;
  String? endDate;
  Package? package;
  Subscription({this.startDate, this.endDate, this.package});
  Subscription.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    package = json['package'] != null ? Package.fromJson(json['package']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    if (package != null) {
      data['package'] = package!.toJson();
    }
    return data;
  }
}

class Package {
  String? packageType;
  Package({this.packageType});
  Package.fromJson(Map<String, dynamic> json) {
    packageType = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = packageType;
    return data;
  }
}
