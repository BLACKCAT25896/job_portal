class ProfileModel {
  bool? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? tokenType;
  String? accessToken;

  Data({this.user, this.tokenType, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token_type'] = tokenType;
    data['access_token'] = accessToken;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  String? avatar;
  int? roleId;
  String? userType;
  int? profileViews;
  String? regionCode;
  String? facebookUrl;
  String? twitterUrl;
  String? linkedinUrl;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.phone,
        this.avatar,
        this.roleId,
        this.userType,
        this.profileViews,
        this.regionCode,
        this.facebookUrl,
        this.twitterUrl,
        this.linkedinUrl,
       });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    roleId = json['role_id'];
    userType = json['user_type'];
    profileViews = json['profile_views'];
    regionCode = json['region_code'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['role_id'] = roleId;
    data['user_type'] = userType;
    data['profile_views'] = profileViews;
    data['region_code'] = regionCode;
    data['facebook_url'] = facebookUrl;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    return data;
  }
}
