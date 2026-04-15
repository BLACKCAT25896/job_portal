

import 'dart:convert';
import 'package:mighty_job/helper/price_converter.dart';

class PaymentMethodItem {
  int? id;
  String? name;
  String? type;
  Credentials? credentials;
  String? isDefault;
  String? status;
  String? sMethod;

  PaymentMethodItem(
      {this.id,
        this.name,
        this.type,
        this.credentials,
        this.isDefault,
        this.status,
      this.sMethod});

  PaymentMethodItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    type = json['type'];
    try {
      if (json['credentials'] != null) {
        if (json['credentials'] is String) {
          credentials = Credentials.fromJson(
              jsonDecode(json['credentials'])
          );
        } else {
          credentials = Credentials.fromJson(json['credentials']);
        }
      }
    } catch (e) {
      credentials = null;
    }
    isDefault = json['is_default'].toString();
    status = json['status'].toString();
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    if (credentials != null) {
      data['credentials'] = credentials!.toJson();
    }
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
class Credentials {
  String? clientId;
  String? clientSecret;
  String? apiKey;
  String? apiSecret;
  String? storeId;
  String? signatureKey;
  String? appKey;
  String? password;
  String? username;
  String? appSecret;
  String? refundUrl;
  String? merchantId;
  String? merchantKey;
  String? merchantWebsiteLink;
  String? storePassword;
  String? publishedKey;
  String? otherConfigKey;

  Credentials(
      {this.clientId,
        this.clientSecret,
        this.apiKey,
        this.apiSecret,
        this.storeId,
        this.signatureKey,
        this.appKey,
        this.password,
        this.username,
        this.appSecret,
        this.refundUrl,
        this.merchantId,
        this.merchantKey,
        this.merchantWebsiteLink,
        this.storePassword,
        this.publishedKey,
        this.otherConfigKey});

  Credentials.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    apiKey = json['api_key'];
    apiSecret = json['api_secret'];
    storeId = json['store_id'];
    signatureKey = json['signature_key'];
    appKey = json['app_key'];
    password = json['password'];
    username = json['username'];
    appSecret = json['app_secret'];
    refundUrl = json['refund_url'];
    merchantId = json['merchant_id'];
    merchantKey = json['merchant_key'];
    merchantWebsiteLink = json['merchant_website_link'];
    storePassword = json['store_password'];
    publishedKey = json['published_key'];
    otherConfigKey = json['other_config_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['api_key'] = apiKey;
    data['api_secret'] = apiSecret;
    data['store_id'] = storeId;
    data['signature_key'] = signatureKey;
    data['app_key'] = appKey;
    data['password'] = password;
    data['username'] = username;
    data['app_secret'] = appSecret;
    data['refund_url'] = refundUrl;
    data['merchant_id'] = merchantId;
    data['merchant_key'] = merchantKey;
    data['merchant_website_link'] = merchantWebsiteLink;
    data['store_password'] = storePassword;
    data['published_key'] = publishedKey;
    data['other_config_key'] = otherConfigKey;
    return data;
  }
}
