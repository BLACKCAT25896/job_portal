class PackageModel {
  bool? status;
  String? message;
  Data? data;

  PackageModel({this.status, this.message, this.data});

  PackageModel.fromJson(Map<String, dynamic> json) {
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
  List<PackageItem>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PackageItem>[];
      json['data'].forEach((v) {
        data!.add(PackageItem.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class PackageItem {
  int? id;
  String? name;
  String? type;
  String? price;
  String? finalPrice;
  String? currency;
  String? billingCycle;
  int? durationDays;
  bool? isFeatured;
  bool? isActive;
  Features? features;

  PackageItem(
      {this.id,
        this.name,
        this.type,
        this.price,
        this.finalPrice,
        this.currency,
        this.billingCycle,
        this.durationDays,
        this.isFeatured,
        this.isActive,
        this.features});

  PackageItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    finalPrice = json['final_price'];
    currency = json['currency'];
    billingCycle = json['billing_cycle'];
    durationDays = json['duration_days'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    features = json['features'] != null
        ? Features.fromJson(json['features'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['price'] = price;
    data['final_price'] = finalPrice;
    data['currency'] = currency;
    data['billing_cycle'] = billingCycle;
    data['duration_days'] = durationDays;
    data['is_featured'] = isFeatured;
    data['is_active'] = isActive;
    if (features != null) {
      data['features'] = features!.toJson();
    }
    return data;
  }
}

class Features {
  String? jobPostLimit;
  String? cvViewLimit;
  String? messageCandidate;
  String? featuredJob;
  String? companyHighlight;
  String? analytics;

  Features(
      {this.jobPostLimit,
        this.cvViewLimit,
        this.messageCandidate,
        this.featuredJob,
        this.companyHighlight,
        this.analytics});

  Features.fromJson(Map<String, dynamic> json) {
    jobPostLimit = json['job_post_limit'];
    cvViewLimit = json['cv_view_limit'];
    messageCandidate = json['message_candidate'];
    featuredJob = json['featured_job'];
    companyHighlight = json['company_highlight'];
    analytics = json['analytics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_post_limit'] = jobPostLimit;
    data['cv_view_limit'] = cvViewLimit;
    data['message_candidate'] = messageCandidate;
    data['featured_job'] = featuredJob;
    data['company_highlight'] = companyHighlight;
    data['analytics'] = analytics;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.lastPage, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}
