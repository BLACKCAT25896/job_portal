
import 'package:mighty_job/helper/price_converter.dart';

class CandidateResumeItem {
  int? id;
  int? candidateId;
  String? title;
  String? filePath;
  String? fileName;
  String? mimeType;
  String? type;
  int? isDefault;
  int? status;

  CandidateResumeItem(
      {this.id,
        this.candidateId,
        this.title,
        this.filePath,
        this.fileName,
        this.mimeType,
        this.type,
        this.isDefault,
        this.status,
       });

  CandidateResumeItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    candidateId = PriceConverter.parseInt(json['candidate_id']);
    title = json['title'];
    filePath = json['file_path'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    type = json['type'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['title'] = title;
    data['file_path'] = filePath;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['type'] = type;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}
