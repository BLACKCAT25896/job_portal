

import 'package:job/helper/price_converter.dart';
class CandidateLinkItem {
  int? id;
  String? platform;
  String? url;


  CandidateLinkItem(
      {this.id,
        this.platform,
        this.url,
       });

  CandidateLinkItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    platform = json['platform'];
    url = json['url'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['platform'] = platform;
    data['url'] = url;

    return data;
  }
}