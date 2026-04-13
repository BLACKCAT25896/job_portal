import 'package:ecommerce/feature/human_resource/interview/domain/models/interview_body.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/interview/domain/models/interview_model.dart';
import 'package:ecommerce/feature/human_resource/interview/domain/repository/interview_repository.dart';

class InterviewController extends GetxController implements GetxService{
  final InterviewRepository interviewRepository;
  InterviewController({required this.interviewRepository});




  bool isLoading = false;
  ApiResponse<InterviewItem>? interviewModel;
  Future<void> getInterviewList(int offset) async {
    Response? response = await interviewRepository.getInterviewList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<InterviewItem>.fromJson(response?.body, (json)=> InterviewItem.fromJson(json));
      if(offset == 1){
        interviewModel = apiResponse;
      }else{
        interviewModel?.data?.data?.addAll(apiResponse.data!.data!);
        interviewModel?.data?.currentPage = apiResponse.data?.currentPage;
        interviewModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewInterview(InterviewBody body) async {
    isLoading = true;
    update();
    Response? response = await interviewRepository.createNewInterview(body);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getInterviewList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateInterview(InterviewBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await interviewRepository.updateInterview(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getInterviewList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteInterview(int id) async {
    isLoading = true;
    Response? response = await interviewRepository.deleteInterview(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getInterviewList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  InterviewItem? selectedInterviewItem;
  void selectInterview(InterviewItem item){
    selectedInterviewItem = item;
    update();
  }
  List<String> interviewStatus = ["pending","shortlisted","rejected","hired"];
  String selectedInterviewStatus = "pending";
  void selectInterviewStatus(String status) {
    selectedInterviewStatus = status;
    update();
  }

  
}