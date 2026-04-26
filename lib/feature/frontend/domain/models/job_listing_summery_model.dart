import 'package:mighty_job/helper/price_converter.dart';

class JobListingSummeryModel {
  bool? status;
  String? message;
  SummeryItem? data;

  JobListingSummeryModel({this.status, this.message, this.data});

  JobListingSummeryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SummeryItem.fromJson(json['data']) : null;
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

class SummeryItem {
  int? liveJobs;
  int? vacancies;
  int? companies;
  int? newJobs;

  SummeryItem({this.liveJobs, this.vacancies, this.companies, this.newJobs});

  SummeryItem.fromJson(Map<String, dynamic> json) {
    liveJobs = PriceConverter.parseInt(json['live_jobs']);
    vacancies = PriceConverter.parseInt(json['vacancies']);
    companies = PriceConverter.parseInt(json['companies']);
    newJobs = PriceConverter.parseInt(json['new_jobs']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['live_jobs'] = liveJobs;
    data['vacancies'] = vacancies;
    data['companies'] = companies;
    data['new_jobs'] = newJobs;
    return data;
  }
}
