
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_body.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/job_listing/domain/repository/job_listing_repository.dart';
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






  Future<void> createNewJobListing(JobListingBody listingBody) async {
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

  Future<void> updateJobListing(JobListingBody listingBody, int id) async {
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
  
}