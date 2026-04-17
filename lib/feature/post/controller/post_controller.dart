
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post/domain/models/post_body.dart';
import 'package:mighty_job/feature/post/domain/models/post_model.dart';
import 'package:mighty_job/feature/post/domain/repository/post_repository.dart';

class PostController extends GetxController implements GetxService{
  final PostRepository postRepository;
  PostController({required this.postRepository});




  bool isLoading = false;
  ApiResponse<PostItem>? postModel;
  Future<void> getPostList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await postRepository.getPostList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PostItem>.fromJson(response?.body, (json)=>
          PostItem.fromJson(json));
      if(offset == 1){
        postModel = apiResponse;
      }else{
        postModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        postModel?.data?.total = apiResponse.data?.total;
        postModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  PostItem? selectedPostItem;
  void selectPost(PostItem? item, {bool notify = true}) {
    selectedPostItem = item;
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



  Future<void> createNewPost(PostBody postBody) async {
    isLoading = true;
    update();
    Response? response = await postRepository.createNewPost(postBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getPostList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updatePost(PostBody postBody, int id) async {
    isLoading = true;
    update();
    Response? response = await postRepository.updatePost(postBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPostList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deletePost(int id) async {
    isLoading = true;
    Response? response = await postRepository.deletePost(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPostList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}