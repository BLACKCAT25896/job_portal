import 'package:job/helper/price_converter.dart';

class DashboardReportModel {
  bool? status;
  String? message;
  DashboardInfo? data;

  DashboardReportModel({this.status, this.message, this.data});

  DashboardReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DashboardInfo.fromJson(json['data']) : null;
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

class DashboardInfo {
  Cards? cards;
  Charts? charts;
  Pipeline? pipeline;
  List<Vacancies>? vacancies;
  List<RecentApplications>? recentApplications;
  List<RecentActivity>? recentActivity;

  DashboardInfo(
      {this.cards,
        this.charts,
        this.pipeline,
        this.vacancies,
        this.recentApplications,
        this.recentActivity});

  DashboardInfo.fromJson(Map<String, dynamic> json) {
    cards = json['cards'] != null ? Cards.fromJson(json['cards']) : null;
    charts =
    json['charts'] != null ? Charts.fromJson(json['charts']) : null;
    pipeline = json['pipeline'] != null
        ? Pipeline.fromJson(json['pipeline'])
        : null;
    if (json['vacancies'] != null) {
      vacancies = <Vacancies>[];
      json['vacancies'].forEach((v) {
        vacancies!.add(Vacancies.fromJson(v));
      });
    }
    if (json['recent_applications'] != null) {
      recentApplications = <RecentApplications>[];
      json['recent_applications'].forEach((v) {
        recentApplications!.add(RecentApplications.fromJson(v));
      });
    }
    if (json['recent_activity'] != null) {
      recentActivity = <RecentActivity>[];
      json['recent_activity'].forEach((v) {
        recentActivity!.add(RecentActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cards != null) {
      data['cards'] = cards!.toJson();
    }
    if (charts != null) {
      data['charts'] = charts!.toJson();
    }
    if (pipeline != null) {
      data['pipeline'] = pipeline!.toJson();
    }
    if (vacancies != null) {
      data['vacancies'] = vacancies!.map((v) => v.toJson()).toList();
    }
    if (recentApplications != null) {
      data['recent_applications'] =
          recentApplications!.map((v) => v.toJson()).toList();
    }
    if (recentActivity != null) {
      data['recent_activity'] =
          recentActivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  int? applications;
  int? shortlisted;
  int? hired;
  int? rejected;

  Cards({this.applications, this.shortlisted, this.hired, this.rejected});

  Cards.fromJson(Map<String, dynamic> json) {
    applications = json['applications'];
    shortlisted = json['shortlisted'];
    hired = json['hired'];
    rejected = json['rejected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applications'] = applications;
    data['shortlisted'] = shortlisted;
    data['hired'] = hired;
    data['rejected'] = rejected;
    return data;
  }
}

class Charts {
  List<int>? applicationsPerMonth;
  List<ApplicationsByCategory>? applicationsByCategory;

  Charts({this.applicationsPerMonth, this.applicationsByCategory});

  Charts.fromJson(Map<String, dynamic> json) {
    applicationsPerMonth = json['applications_per_month'].cast<int>();
    if (json['applications_by_category'] != null) {
      applicationsByCategory = <ApplicationsByCategory>[];
      json['applications_by_category'].forEach((v) {
        applicationsByCategory!.add(ApplicationsByCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applications_per_month'] = applicationsPerMonth;
    if (applicationsByCategory != null) {
      data['applications_by_category'] =
          applicationsByCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApplicationsByCategory {
  String? name;
  int? total;

  ApplicationsByCategory({this.name, this.total});

  ApplicationsByCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['total'] = total;
    return data;
  }
}

class Pipeline {
  int? applied;
  double? shortlisted;
  int? interview;
  int? finalInterview;
  double? hired;

  Pipeline(
      {this.applied,
        this.shortlisted,
        this.interview,
        this.finalInterview,
        this.hired});

  Pipeline.fromJson(Map<String, dynamic> json) {
    applied = PriceConverter.parseInt(json['applied']);
    shortlisted = PriceConverter.parseAmount(json['shortlisted']);
    interview = PriceConverter.parseInt(json['interview']);
    finalInterview = PriceConverter.parseInt(json['final_interview']);
    hired = PriceConverter.parseAmount(json['hired']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applied'] = applied;
    data['shortlisted'] = shortlisted;
    data['interview'] = interview;
    data['final_interview'] = finalInterview;
    data['hired'] = hired;
    return data;
  }
}

class Vacancies {
  String? title;
  String? company;
  String? salary;
  int? applications;

  Vacancies({this.title, this.company, this.salary, this.applications});

  Vacancies.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    company = json['company'];
    salary = json['salary'];
    applications = json['applications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['company'] = company;
    data['salary'] = salary;
    data['applications'] = applications;
    return data;
  }
}

class RecentApplications {
  String? candidate;
  String? jobTitle;
  String? status;
  String? date;

  RecentApplications({this.candidate, this.jobTitle, this.status, this.date});

  RecentApplications.fromJson(Map<String, dynamic> json) {
    candidate = json['candidate'];
    jobTitle = json['job_title'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate'] = candidate;
    data['job_title'] = jobTitle;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}

class RecentActivity {
  String? message;
  String? time;

  RecentActivity({this.message, this.time});

  RecentActivity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
