
import 'package:job/helper/price_converter.dart';

class CandidateResumeItem {
  int? id;
  String? title;
  String? filePath;
  String? fileName;
  String? mimeType;
  String? type;
  int? isDefault;
  int? status;
  String? createdAt;

  CandidateResumeItem(
      {this.id,
        this.title,
        this.filePath,
        this.fileName,
        this.mimeType,
        this.type,
        this.isDefault,
        this.status,
        this.createdAt,
       });

  CandidateResumeItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    title = json['title'];
    filePath = json['file_path'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    type = json['type'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);
    createdAt = json['created_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['file_path'] = filePath;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['type'] = type;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
