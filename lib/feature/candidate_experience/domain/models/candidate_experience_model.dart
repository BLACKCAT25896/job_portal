
import 'package:job/helper/price_converter.dart';

class CandidateExperienceItem {
  int? id;
  String? companyName;
  String? companyBusiness;
  String? designation;
  String? department;
  String? startDate;
  String? endDate;
  int? currentlyWorking;
  String? responsibilities;
  String? expertiseAreas;

  CandidateExperienceItem(
      {this.id,
        this.companyName,
        this.companyBusiness,
        this.designation,
        this.department,
        this.startDate,
        this.endDate,
        this.currentlyWorking,
        this.responsibilities,
        this.expertiseAreas,
       });

  CandidateExperienceItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    companyName = json['company_name'];
    companyBusiness = json['company_business'];
    designation = json['designation'];
    department = json['department'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    currentlyWorking = PriceConverter.parseInt(json['currently_working']);
    responsibilities = json['responsibilities'];
    expertiseAreas = json['expertise_areas'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_business'] = companyBusiness;
    data['designation'] = designation;
    data['department'] = department;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['currently_working'] = currentlyWorking;
    data['responsibilities'] = responsibilities;
    data['expertise_areas'] = expertiseAreas;
    return data;
  }
}
