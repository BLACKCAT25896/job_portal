
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_body.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_model.dart';
import 'package:mighty_job/feature/post_comment/domain/repository/post_comment_repository.dart';

class PostCommentController extends GetxController implements GetxService{
  final PostCommentRepository postCommentRepository;
  PostCommentController({required this.postCommentRepository});




  bool isLoading = false;
  ApiResponse<PostCommentItem>? postCommentModel;
  Future<void> getPostCommentList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await postCommentRepository.getPostCommentList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PostCommentItem>.fromJson(response?.body, (json)=>
          PostCommentItem.fromJson(json));
      if(offset == 1){
        postCommentModel = apiResponse;
      }else{
        postCommentModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        postCommentModel?.data?.total = apiResponse.data?.total;
        postCommentModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  PostCommentItem? selectedPostCommentItem;
  void selectPostComment(PostCommentItem? item, {bool notify = true}) {
    selectedPostCommentItem = item;
    if(notify) {
      update();
    }
  }


  bool isFeatured = false;
  bool isDefault = false;

  void toggleIsFeatured({bool notify = true}){
    isFeatured = !isFeatured;
    if(notify) {
      update();
    }
  }
  void toggleIsisDefault({bool notify = true}){
    isDefault = !isDefault;
    if(notify) {
      update();
    }
  }



  Future<void> createNewPostComment(PostCommentBody postCommentBody) async {
    isLoading = true;
    update();
    Response? response = await postCommentRepository.createNewPostComment(postCommentBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getPostCommentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updatePostComment(PostCommentBody postCommentBody, int id) async {
    isLoading = true;
    update();
    Response? response = await postCommentRepository.updatePostComment(postCommentBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPostCommentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deletePostComment(int id) async {
    isLoading = true;
    Response? response = await postCommentRepository.deletePostComment(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPostCommentList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}