
import 'package:mighty_job/helper/price_converter.dart';

class ReportedJobItem {
  int? id;
  int? candidateId;
  int? jobListingId;
  String? note;
  int? isResolved;


  ReportedJobItem(
      {this.id,
        this.candidateId,
        this.jobListingId,
        this.note,
        this.isResolved,
     });

  ReportedJobItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    candidateId = PriceConverter.parseInt(json['candidate_id']);
    jobListingId = json['job_listing_id'];
    note = json['note'];
    isResolved = PriceConverter.parseInt(json['is_resolved']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['job_listing_id'] = jobListingId;
    data['note'] = note;
    data['is_resolved'] = isResolved;
    return data;
  }
}
