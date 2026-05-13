import 'package:flutter/material.dart';

class CandidateProfileSectionModel {
  String name;
  IconData icon;
  List<SubSection> subSection;

  CandidateProfileSectionModel({required this.name, required this.icon, required this.subSection});
}

class SubSection{
  String name;
  String? icon;
  SubSection({required this.name, this.icon});
}

List<CandidateProfileSectionModel> candidateProfileSection = [
  CandidateProfileSectionModel(
    name: "personal_information",
    icon: Icons.person,
    subSection: [
      SubSection(name: "personal_details"),
      SubSection(name: "address_details"),
      SubSection(name: "career_and_application"),
      SubSection(name: "relevant_information"),
    ],
  ),
  CandidateProfileSectionModel(
    name: "education_and_training",
    icon: Icons.school,
    subSection: [
      SubSection(name: "education"),
      SubSection(name: "training"),
      SubSection(name: "certifications"),

    ],
  ),
  CandidateProfileSectionModel(
    name: "employment",
    icon: Icons.work,
    subSection: [
      SubSection(name: "work_experience"),
      SubSection(name: "employment_history"),
    ],
  ),
  CandidateProfileSectionModel(
    name: "other_information",
    icon: Icons.info,
    subSection: [
      SubSection(name: "skills"),
      SubSection(name: "languages"),
      SubSection(name: "reference"),
      SubSection(name: "social_links"),
    ],
  ),
];