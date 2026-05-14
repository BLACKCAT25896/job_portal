class CandidateLinkBody {
  String? platform;
  String? url;
  int? status;
  String? sMethod;

  CandidateLinkBody({this.platform, this.url, this.status, this.sMethod});

  CandidateLinkBody.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    url = json['url'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['platform'] = platform;
    data['url'] = url;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
