
import 'package:flutter/material.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/job_listing/domain/models/benefit_model.dart';
import 'package:job/feature/job_listing/domain/models/post_a_job_body.dart';
import 'package:job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:job/feature/job_listing/domain/models/step_model.dart';
import 'package:job/feature/job_listing/domain/repository/job_listing_repository.dart';
import 'package:get/get.dart';

class JobListingController extends GetxController implements GetxService{
  final JobListingRepository listingRepository;
  JobListingController({required this.listingRepository});




  bool isLoading = false;
  ApiResponse<JobListingItem>? listingModel;
  Future<void> getJobListingList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await listingRepository.getJobListingList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<JobListingItem>.fromJson(response?.body, (json)=>
          JobListingItem.fromJson(json));
      if(offset == 1){
        listingModel = apiResponse;
      }else{
        listingModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        listingModel?.data?.total = apiResponse.data?.total;
        listingModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  JobListingItem? selectedJobListingItem;
  void selectJobListing(JobListingItem? item, {bool notify = true}) {
    selectedJobListingItem = item;
    if(notify) {
      update();
    }
  }






  Future<void> createNewJobListing(PostAJobBody listingBody) async {
    isLoading = true;
    update();
    Response? response = await listingRepository.createNewJobListing(listingBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getJobListingList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateJobListing(PostAJobBody listingBody, int id) async {
    isLoading = true;
    update();
    Response? response = await listingRepository.updateJobListing(listingBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getJobListingList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteJobListing(int id) async {
    isLoading = true;
    Response? response = await listingRepository.deleteJobListing(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getJobListingList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  int selectedStepIndex = 0;
  void selectStep(int index) {
    selectedStepIndex = index;
    steps[index].isActive = true;
    update();
  }



   List<StepItem> steps = [
    StepItem(
      title: "job_information",
      icon: Icons.work_outline_rounded,
      isActive: true,
    ),
    StepItem(
      title: "candidate_requirements",
      icon: Icons.groups_2_outlined,
    ),
    StepItem(
      title: "matching_and_restrictions",
      icon: Icons.rule_folder_outlined,
    ),
    StepItem(
      title: "billing_and_contact_info",
      icon: Icons.payments_outlined,
    ),
  ];

  List<String> employeeStatus = ["full_time", "part_time", "contract", "internship", "freelance"];
  String selectedEmployeeStatus = "full_time";
  void selectEmployeeStatus(String status) {
    selectedEmployeeStatus = status;
    update();
  }

  List<String> workPlace = ["work_from_office", "work_from_home"];
  String selectedWorkPlace = "work_from_office";
  void selectWorkPlace(String place) {
    selectedWorkPlace = place;
    update();
  }

  List<String> lunchFacility = ["partially_subsidize", "fully_subsidize"];
  String? selectedLunchFacility;
  void selectLunchFacility(String facility) {
    selectedLunchFacility = facility;
    update();
  }

  List<String> salaryReview = ["half_yearly", "yearly"];
  String? selectedSalaryReview;
  void selectSalaryReview(String review) {
    selectedSalaryReview = review;
    update();
  }

  List<String> festivalBonus = ["1", "2", "3", "4"];
  String? selectedFestivalBonus;
  void selectFestivalBonus(String bonus) {
    selectedFestivalBonus = bonus;
    update();
  }


  List<BenefitModel> benefits = [
    BenefitModel(title: "T/A"),
    BenefitModel(title: "Provident fund"),
    BenefitModel(title: "Pension policy"),
    BenefitModel(title: "Tour allowance"),
    BenefitModel(title: "Medical allowance"),
    BenefitModel(title: "Mobile bill"),
    BenefitModel(title: "Credit card"),
    BenefitModel(title: "Weekly 2 holidays"),
    BenefitModel(title: "Overtime allowance"),
    BenefitModel(title: "Performance bonus"),
    BenefitModel(title: "Insurance"),
    BenefitModel(title: "Profit share"),
    BenefitModel(title: "Gratuity"),
  ];

  void toggleBenefitSelection(int index){
    benefits[index].isSelected = !benefits[index].isSelected!;
    update();
  }

  bool hideSalary = false;
  void toggleHideSalary(){
    hideSalary = !hideSalary;
    update();
  }

}