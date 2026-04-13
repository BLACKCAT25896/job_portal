class CmsSectionReorderBody {
  List<Sections>? sections;

  CmsSectionReorderBody({this.sections});

  CmsSectionReorderBody.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  int? id;
  int? serial;

  Sections({this.id, this.serial});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serial = json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serial'] = serial;
    return data;
  }
}
