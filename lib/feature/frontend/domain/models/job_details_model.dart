import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';

class LandingJobDetailsModel {
  bool? status;
  String? message;
  JobDetailsItem? data;

  LandingJobDetailsModel({this.status, this.message, this.data});

  LandingJobDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? JobDetailsItem.fromJson(json['data']) : null;
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

class JobDetailsItem {
  JobListingItem? job;
  bool? isApplied;

  JobDetailsItem({this.job, this.isApplied});

  JobDetailsItem.fromJson(Map<String, dynamic> json) {
    job = json['job'] != null ? JobListingItem.fromJson(json['job']) : null;
    isApplied = json['is_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (job != null) {
      data['job'] = job!.toJson();
    }
    data['is_applied'] = isApplied;
    return data;
  }
}
