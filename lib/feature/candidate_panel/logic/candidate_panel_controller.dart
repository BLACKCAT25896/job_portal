import 'package:get/get.dart';
import 'package:job/feature/candidate_panel/domain/model/Candidate_profile_section_model.dart';

class CandidatePanelController extends GetxController implements GetxService{


  List<CandidateProfileSectionModel> sections = candidateProfileSection;
  CandidateProfileSectionModel? selectedSection = candidateProfileSection[0];
  void selectSection(CandidateProfileSectionModel section){
    selectedSection = section;
    expandedSectionKey = section.name;
    setSubSection(section.subSection[0]);
    update();
  }

  SubSection? selectedSubSection = candidateProfileSection[0].subSection[0];
  void setSubSection(SubSection subSection){
    selectedSubSection = subSection;
    toggleSection(subSection.name);
    update();
  }

  String? expandedSectionKey = "personal_details";
  void toggleSection(String key) {
    if (expandedSectionKey == key) {
      expandedSectionKey = null;
    } else {
      expandedSectionKey = key;
    }
    update();
  }
  bool isExpanded(String key) {
    return expandedSectionKey == key;
  }
}