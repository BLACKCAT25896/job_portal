
import 'package:flutter/material.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/global_widget/fetch_paginated_list.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/company/domain/models/company_model.dart';
import 'package:mighty_job/feature/frontend/domain/models/frontend_policy_model.dart';
import 'package:mighty_job/feature/frontend/domain/repository/frontend_repository.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/policy_enum.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/post/domain/models/post_model.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_model.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';

class LandingPageController extends GetxController implements GetxService{
  final LandingRepository landingRepository;
  LandingPageController({required this.landingRepository});


  ApiResponse<IndustryItem>? publicIndustryModel;
  Future<void> getLandingIndustryList(int offset, {String search = ""}) async {
    publicIndustryModel = await fetchPaginatedList<IndustryItem>(
      offset: offset,
      currentModel: publicIndustryModel,
      apiCall: () => landingRepository.getLandingIndustriesList(offset, search),
      fromJson: (json) => IndustryItem.fromJson(json),
      onUpdate: (value) => publicIndustryModel = value,
    );

    update();
  }

  IndustryItem? selectedIndustryItem;
  void selectIndustry(IndustryItem item) {
    selectedIndustryItem = item;
    update();
  }

  bool isCategorySelected = false;
  void toggleCategorySelection() {
    isCategorySelected = !isCategorySelected;
    update();
  }


  ApiResponse<CompanyItem>? publicCompanyModel;
  Future<void> getLandingCompanyList(int offset, {String search = ""}) async {
    publicCompanyModel = await fetchPaginatedList<CompanyItem>(
      offset: offset,
      currentModel: publicCompanyModel,
      apiCall: () => landingRepository.getLandingCompanies(offset, search),
      fromJson: (json) => CompanyItem.fromJson(json),
      onUpdate: (value) => publicCompanyModel = value,
    );

    update();
  }

  ApiResponse<SkillItem>? publicSkillModel;
  Future<void> getLandingSkillList(int offset, {String search = ""}) async {
    publicSkillModel = await fetchPaginatedList<SkillItem>(
      offset: offset,
      currentModel: publicSkillModel,
      apiCall: () => landingRepository.getLandingSkills(offset, search),
      fromJson: (json) => SkillItem.fromJson(json),
      onUpdate: (value) => publicSkillModel = value,
    );
    update();
  }

  ApiResponse<JobCategoryItem>? publicJobCategoryModel;
  Future<void> getLandingJobCategoryList(int offset, {String search = ""}) async {
    publicJobCategoryModel = await fetchPaginatedList<JobCategoryItem>(
      offset: offset,
      currentModel: publicJobCategoryModel,
      apiCall: () => landingRepository.getLandingJobCategories(offset, search),
      fromJson: (json) => JobCategoryItem.fromJson(json),
      onUpdate: (value) => publicJobCategoryModel = value,
    );
    update();
  }


  ApiResponse<JobListingItem>? publicJobListingModel;
  Future<void> getLandingJobListingList(int offset, {String search = ""}) async {
    publicJobListingModel = await fetchPaginatedList<JobListingItem>(
      offset: offset,
      currentModel: publicJobListingModel,
      apiCall: () => landingRepository.getLandingJobListing(offset, search),
      fromJson: (json) => JobListingItem.fromJson(json),
      onUpdate: (value) => publicJobListingModel = value,
    );
    update();
  }

  ApiResponse<PostCategoryItem>? publicPostCategoryModel;
  Future<void> getLandingPostCategoryList(int offset, {String search = ""}) async {
    publicPostCategoryModel = await fetchPaginatedList<PostCategoryItem>(
      offset: offset,
      currentModel: publicPostCategoryModel,
      apiCall: () => landingRepository.getLandingPostCategories(offset, search),
      fromJson: (json) => PostCategoryItem.fromJson(json),
      onUpdate: (value) => publicPostCategoryModel = value,
    );
    update();
  }


  ApiResponse<PostItem>? publicPostModel;
  Future<void> getLandingPostList(int offset, {String search = ""}) async {
    publicPostModel = await fetchPaginatedList<PostItem>(
      offset: offset,
      currentModel: publicPostModel,
      apiCall: () => landingRepository.getLandingPost(offset, search),
      fromJson: (json) => PostItem.fromJson(json),
      onUpdate: (value) => publicPostModel = value,
    );
    update();
  }


  FrontendPolicyModel? privacyPolicyModel;
  FrontendPolicyModel? termsPolicyModel;
  FrontendPolicyModel? cookiePolicyModel;

  Future<void> getPolicy(PolicyEnum type) async {
    Response response;
    if(type == PolicyEnum.privacyPolicy){
      response = await landingRepository.privacyPolicy();
    }else if(type == PolicyEnum.termsOfService){
      response = await landingRepository.termsAndCondition();
    }else{
      response = await landingRepository.cookiePolicy();
    }
    if (response.statusCode == 200) {
      if(type == PolicyEnum.privacyPolicy){
        privacyPolicyModel = FrontendPolicyModel.fromJson(response.body);
      }else if(type == PolicyEnum.termsOfService){
        termsPolicyModel = FrontendPolicyModel.fromJson(response.body);
      }else{
        cookiePolicyModel = FrontendPolicyModel.fromJson(response.body);
      }
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  bool isLoading = false;
  Future<void> newsLetter(String email) async {
    isLoading = true;
    update();
    Response response = await landingRepository.newsLetter(email);
    if (response.statusCode == 200) {
      showCustomSnackBar("subscribed_successfully".tr, isError: false);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  double salaryMin = 0;
  double salaryMax = 100;

  double ageMin = 0;
  double ageMax = 100;

  double experienceMin = 0;
  double experienceMax = 50;

  RangeValues salaryRange = RangeValues(0, 500000);
  RangeValues ageRange = RangeValues(20, 50);
  RangeValues experienceRange = RangeValues(0, 50);

  void initRanges() {
    salaryRange = RangeValues(salaryMin, salaryMax);
    ageRange = RangeValues(ageMin, ageMax);
    experienceRange = RangeValues(experienceMin, experienceMax);
  }
  void updateSalaryRange(RangeValues values) {
    salaryRange = values;
    update();
  }

  void updateAgeRange(RangeValues values) {
    ageRange = values;
    update();
  }

  void updateExperienceRange(RangeValues values) {
    experienceRange = values;
    update();
  }




}